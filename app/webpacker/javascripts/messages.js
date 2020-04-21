import './libraries/notify';

(function () {
  var show_ajax_message;

  $(document).ready(function () {

    var flash_messages = document.getElementsByClassName("flash_message");
    Array.prototype.forEach.call(flash_messages, function (flash_message) {

      var message_type = flash_message.className.replace(" flash_message", "").replace("alert", "error").replace("notice", "info");
      var autoHide = message_type !== 'error';
      setTimeout((function () {
        return show_ajax_message(flash_message.innerHTML, message_type, autoHide);
      }), 600);
    });

    return $(document).on("ajax:success", function (event) {
      var data, msg, status, type, xhr, _ref;
      _ref = event.detail, data = _ref[0], status = _ref[1], xhr = _ref[2];
      msg = xhr.getResponseHeader('X-Message');
      type = xhr.getResponseHeader('X-Message-Type');
      return show_ajax_message(msg, type.replace("alert", "error").replace("notice", "info"));
    });
  });

  show_ajax_message = function (msg, type, autoHide) {
    if (autoHide == null) {
      autoHide = true;
    }

    // $.notify.addStyle('happyblue', {
    //   html: "<div>☺<span data-notify-text/>☺</div>",
    //   classes: {
    //     base: {
    //       "white-space": "nowrap",
    //       "background-color": "lightblue",
    //       "padding": "5px"
    //     },
    //     superblue: {
    //       "color": "white",
    //       "background-color": "blue"
    //     }
    //   }
    // });

    return $.notify(msg, {
      position: 'bottom left',
      className: type,
      clickToHide: true,
      autoHide: autoHide,
      autoHideDelay: 6000,
      showAnimation: 'slideDown',
      showDuration: 600,
      hideAnimation: 'slideUp',
      hideDuration: 400
    });
  };

}).call(this);