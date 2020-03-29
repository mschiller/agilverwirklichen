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
  document.getElementById("js_full_teaser").style.height = (heights - 185) + "px";
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