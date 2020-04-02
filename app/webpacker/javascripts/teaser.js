import 'bxslider/dist/jquery.bxslider';

$(function () {
  $('.bxslider').bxSlider({
    auto: true,
    pause: 6000,
    autoHover: false,
    minSlides: 2,
    maxSlides: 5,
    randomStart: true,
    infiniteLoop: true,
    randomStart: true,
    easing: 'swing',
    mode: 'horizontal',
    //adaptiveHeight: true,
    //preloadImages: 'all',
    hideControlOnEnd: true,

    onSliderLoad: function () {
      setTimeout(function () {
        $('#teaser').css('visibility', 'visible');
      }, 20);
    }
  });
});

var xSeconds = 3000; // 2 second


function resize() {
  var heights = window.innerHeight;
  var js_full_teaser = $("#js_full_teaser")
  if (typeof (js_full_teaser) != 'undefined' && js_full_teaser != null) {
    js_full_teaser.css("height", (heights - 185) + "px");

    $(".bxslider").css("height", heights / 2);
    $(".bx-clone").css("height", heights / 2);
  }
}

$(document).ready(function () {
  resize();

  setTimeout(function () {
    $('#js_fade_header').fadeIn('slow');
  }, xSeconds);
});

window.onresize = function () {
  resize();
};