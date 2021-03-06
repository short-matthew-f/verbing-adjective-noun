var currentWords = {};
var startingLetter = "";
var euphemism = {};

function fetchWords (args) {
  var args = args || {};

  $.ajax({
    url: "/words/fetch",
    dataType: "json",
    data: {
      word: {
        part_of_speech: args.part_of_speech,
        count: args.count,
        starting_letter: args.starting_letter
      }
    },
    success: function (data) {
      var part = data.partOfSpeech;
      currentWords[part] = data.words;
      renderWords(part);
      $("#" + part).text('______');
      delete euphemism[part + "_id"];
      allowSubmit();
    }
  })
};

function renderWords (partOfSpeech) {
  var $ul = $("#" + partOfSpeech + "-list");
  $ul.empty();

  $.each(currentWords[partOfSpeech], function (i, word) {
    $li = $('<li>').text(word.content)
                   .data('id', word.id)
                   .data('part', partOfSpeech);
    $ul.append($li);
  })

  for (var i = currentWords[partOfSpeech].length; i < 5; i++) {
    $ul.append($("<li>"))
  }
};

function validEuphemism () {
  return Object.keys(euphemism).length == 3;
}

function allowSubmit () {
  if (validEuphemism()) {
    $("#create-euphemism").slideDown();
  } else {
    $("#create-euphemism").slideUp();
  }
};

function setStartingLetter () {
  var letters = "abcdefghijklmnopqrstuvwyz";
  startingLetter = letters[Math.floor(Math.random() * letters.length)];
}

function refreshWords (args) {
  if (startingLetter != "") { setStartingLetter(); }
  $.each(["verb", "adjective", "noun"], function (i, partOfSpeech) {
    fetchWords({ part_of_speech: partOfSpeech, count: 5, starting_letter: startingLetter });
  });
};

$(function () {
  refreshWords();

  $("#candidates").on("click", "li", function (e) {
    if ($(this).data('id')) {
      var part = $(this).data("part");
      $(this).siblings().removeClass("selected");
      $(this).addClass("selected");
      $("#current-euphemism").addClass("visible");
      $("#" + part).text( $(this).text() );
      euphemism[part + "_id"] = $(this).data("id");

      allowSubmit();
    }
  });

  $("#candidates").on("click", "th", function (e) {
    fetchWords({
      part_of_speech: $(this).data("part"),
      count: 5,
      starting_letter: startingLetter
    });
  });

  $("#refresh-words").on("click", refreshWords);

  $("#set-alliteration").on("click", function (e) {
    $(this).toggleClass("selected");
    if ($(this).hasClass("selected")) {
      setStartingLetter();
    } else {
      startingLetter = "";
    };
    refreshWords();
  });

  $("#create-euphemism").on("click", function (e) {
    if (validEuphemism()) {
      $.ajax({
        url: "/euphemisms",
        method: "post",
        dataType: "json",
        data: {
          euphemism: euphemism
        },
        success: function (data) {
          console.log(data);
          refreshWords();
        }
      });
    }
  });
});
