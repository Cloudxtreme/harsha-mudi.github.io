$(window).load(function () {

  if (typeof io !== "undefined") {
    var socket = io();
    socket.on('change', function (data) {
        if (data.type == "commit") {
                window.location.reload(true);
        }
    })
  }

});
