import 'bxslider/dist/jquery.bxslider';

$(function () {
  $('.bxslider').bxSlider({
    auto: true,
    pause: 6000,
    autoHover: true,
    minSlides: 2,
    maxSlides: 5,
    randomStart: true,
    infiniteLoop: true,
    randomStart: true,
    easing: 'swing',
    mode: 'horizontal',
    preloadImages: 'all',
    hideControlOnEnd: true,

    onSliderLoad: function () {
      setTimeout(function () {
        $('#teaser').css('visibility', 'visible');
      }, 20);
    }
  });
});