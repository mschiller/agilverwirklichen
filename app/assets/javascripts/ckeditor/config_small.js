CKEDITOR.editorConfig = function (config) {

    config.uiColor = '#ffffff';
    config.width = '100%';
    config.allowedContent = true;

    // Toolbar groups configuration.
    config.toolbar = [
        { name: 'styles', items: [ 'Format', 'Styles', 'FontSize' ] }, //, 'Font'
        { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
        { name: 'links', items: [ 'Link', 'Unlink' ] }
    ];
};
