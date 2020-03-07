class Globals {
    constructor() {
        this.header = document.getElementById('autohide');
        this.flash_message = document.getElementById('flash');
        this.defaultHeaderHeight = +this.header.offsetHeight + 'px';
    }
}

export default (new Globals);
