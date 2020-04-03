import 'bxslider/dist/jquery.bxslider';

$(function () {
  $('.bxslider').bxSlider({
    auto: true,
    pause: 4000,
    autoHover: false,
    minSlides: 2,
    maxSlides: 20,
    randomStart: true,
    infiniteLoop: true,
    randomStart: true,
    easing: 'swing',
    mode: 'horizontal',
    touchEnabled: false,
    //adaptiveHeight: true,
    //preloadImages: 'all',
    hideControlOnEnd: false,
  });
});