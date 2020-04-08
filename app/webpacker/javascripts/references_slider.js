import 'bxslider/dist/jquery.bxslider';

$(function () {
  $('#references .bxslider').bxSlider({
    auto: true,
    pause: 4000,
    autoHover: true,
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