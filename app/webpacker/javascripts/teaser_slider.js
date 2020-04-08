import 'bxslider/dist/jquery.bxslider';

$(function () {
  $('#teaser .bxslider').bxSlider({
    auto: true,
    pause: 4000,
    autoHover: false,
    minSlides: 2,
    maxSlides: 20,
    randomStart: true,
    infiniteLoop: true,
    easing: 'swing',
    mode: 'horizontal',
    touchEnabled: false,
    hideControlOnEnd: false,
  });
});