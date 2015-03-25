var euphemism = {}

function getNextEuphemism () {
  $.ajax({
    url: '/euphemisms/fetch',
    dataType: 'json',
    success: function (data) {
      console.log(data);
    }
  })
}

function renderNextEuphemism (euphemism) {
  if (euphemism == undefined) {

  } else {

  }
}
