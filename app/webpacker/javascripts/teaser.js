import 'bxslider/dist/jquery.bxslider';

$(function () {
  $('.bxslider').bxSlider({
    auto: true,
    pause: 5000,
    autoHover: false,
    minSlides: 2,
    maxSlides: 20,
    randomStart: true,
    infiniteLoop: true,
    randomStart: true,
    easing: 'swing',
    mode: 'horizontal',
    //adaptiveHeight: true,
    //preloadImages: 'all',
    hideControlOnEnd: false,
  });
});

// var xSeconds = 3000; // 2 second

// function resize() {
//   var height = (window.innerHeight - 185) + "px"
//   var js_full_teaser = $("#js_full_teaser")
//   if (typeof (js_full_teaser) != 'undefined' && js_full_teaser != null) {
//     //js_full_teaser.css("height", height);
//     //$(".bxslider").css("height", height);
//     //$(".bx-clone").css("height", height);
//   }
// }

// $(document).ready(function () {
//   resize();

//   setTimeout(function () {
//     $('#js_fade_header').fadeIn('slow');
//   }, xSeconds);
// });

// window.onresize = function () {
//   resize();
// };