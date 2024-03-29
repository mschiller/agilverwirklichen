import 'bxslider/dist/jquery.bxslider';

$(document).on('turbo:load', function () {
  $('#references .bxslider').bxSlider({
    auto: true,
    pause: 7000,
    autoHover: true,
    minSlides: 2,
    maxSlides: 20,
    randomStart: true,
    infiniteLoop: true,
    adaptiveHeight: true,
    easing: 'swing',
    mode: 'horizontal',
    touchEnabled: false,
    hideControlOnEnd: false,
  });
});