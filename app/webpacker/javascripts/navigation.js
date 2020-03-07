import Globals from '../javascripts/globals';
import MobileDetect from 'mobile-detect';

var myVar = [];
var prevScrollpos = window.pageYOffset;
var md = new MobileDetect(window.navigator.userAgent);

window.onscroll = function () {
    if (!md.mobile()) {
        var currentScrollPos = window.pageYOffset;

        var pageHeight = document.documentElement.offsetHeight,
            windowHeight = window.innerHeight,
            scrollPosition = window.scrollY || window.pageYOffset || document.body.scrollTop + (document.documentElement && document.documentElement.scrollTop || 0);

        if (prevScrollpos < 100 || pageHeight <= windowHeight + scrollPosition + 100 || prevScrollpos >= currentScrollPos) {
            for (var i in myVar) {
                clearTimeout(myVar[i]);
            }
            setTimeout(function () {
                Globals.header.style.height = Globals.defaultHeaderHeight;
            }, 300);
        } else {
            myVar.push(setTimeout(function () {
                Globals.header.style.height = '0';
            }, 300));
        }
        prevScrollpos = currentScrollPos;
    }
};

$('.js-menu_burger').bind('click', (function () {
    return function (event) {
        event.preventDefault();
        var main_nav = document.getElementById('main_navigation');

        if (getComputedStyle(main_nav, null).display !== 'none') {
            Globals.header.style.height = Globals.defaultHeaderHeight;
            $('#main_navigation').slideUp(300);

        } else {
            Globals.header.style.height = 'auto';
            $('#main_navigation').slideDown(300, function () {
                Globals.header.style.height = +Globals.header.offsetHeight + 'px';
            });
        }
        return false;
    };
})(this));