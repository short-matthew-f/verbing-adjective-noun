var euphemism = {}

function getNextEuphemism () {
  $.ajax({
    url: '/euphemisms/fetch',
    dataType: 'json',
    success: renderNextEuphemism
  });
};

function registerLike () {
  $.ajax({
    url: "/euphemisms/" + euphemism.id + "/like",
    dataType: "json",
    success: getNextEuphemism
  });
};

function registerDislike () {
  $.ajax({
    url: "/euphemisms/" + euphemism.id + "/dislike",
    dataType: "json",
    success: getNextEuphemism
  });
};

function renderNextEuphemism (eu) {
  euphemism = eu;
  if (euphemism == undefined) {
    $('#vote-target').text("You've voted on everything!");
    $('#vote-nav').slideUp(200)
  } else {
    $('#vote-target').text(euphemism.content);
    $('#vote-nav').show();
  };
};

$(function () {
  getNextEuphemism();

  $("#like").on("click", registerLike);

  $("#next").on("click", registerDislike);
});
