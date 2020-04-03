import Globals from '../javascripts/globals';

$('.js-menu_burger').bind('click', (function () {
    return function (event) {
        event.preventDefault();

        if ($('#main_navigation').css('display') !== 'none') {
            Globals.header.style.height = Globals.defaultHeaderHeight;
            $('#main_navigation').slideUp(400);

        } else {
            Globals.header.style.height = 'auto';
            $('#main_navigation').slideDown(400, function () {
                Globals.header.style.height = +Globals.header.offsetHeight + 'px';
            });
        }
        return false;
    };
})(this));