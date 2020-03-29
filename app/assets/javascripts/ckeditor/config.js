CKEDITOR.editorConfig = function (config) {

    config.uiColor = '#ffffff';
    config.width = '100%';
    config.allowedContent = true;

    // Toolbar groups configuration.
    config.toolbar = [{
            name: 'styles',
            items: ['Format', 'Styles', 'FontSize']
        }, //, 'Font'
        {
            name: 'colors',
            items: ['TextColor', 'BGColor']
        },
        {
            name: 'basicstyles',
            groups: ['basicstyles', 'cleanup'],
            items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
        },
        {
            name: 'links',
            items: ['Link', 'Unlink']
        }
    ];
};

// CKEDITOR.editorConfig = function (config) {

//     config.language = 'de';
//     config.uiColor = '#ffffff';
//     config.height = '200px';
//     config.width = '100%';

//     config.filebrowserUploadMethod = 'form';

//     /* Filebrowser routes */
//     // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
//     config.filebrowserBrowseUrl = "/ckeditor/attachment_files";

//     // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
//     config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";

//     // The location of a script that handles file uploads in the Flash dialog.
//     config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";

//     // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
//     config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";

//     // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
//     config.filebrowserImageBrowseUrl = "/ckeditor/pictures";

//     // The location of a script that handles file uploads in the Image dialog.
//     config.filebrowserImageUploadUrl = "/ckeditor/pictures?";

//     // The location of a script that handles file uploads.
//     config.filebrowserUploadUrl = "/ckeditor/attachment_files";

//     config.allowedContent = true;

//     // Toolbar groups configuration.
//     config.toolbar = [
//         //{ name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source'] },
//         {
//             name: 'clipboard',
//             groups: ['clipboard', 'undo'],
//             items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo']
//         },
//         // { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
//         // { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
//         {
//             name: 'links',
//             items: ['Link', 'Unlink', 'Anchor']
//         },
//         {
//             name: 'insert',
//             items: ['Image', 'SpecialChar']
//         }, //, 'Flash', 'Table', 'HorizontalRule',
//         {
//             name: 'paragraph',
//             groups: ['list', 'indent', 'blocks', 'align', 'bidi'],
//             items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
//         },
//         '/',
//         {
//             name: 'styles',
//             items: ['Format', 'Styles', 'FontSize']
//         }, //, 'Font'
//         {
//             name: 'colors',
//             items: ['TextColor', 'BGColor']
//         },
//         {
//             name: 'basicstyles',
//             groups: ['basicstyles', 'cleanup'],
//             items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
//         }
//     ];

//     config.toolbar_mini = [{
//             name: 'paragraph',
//             groups: ['list', 'indent', 'blocks', 'align', 'bidi'],
//             items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
//         },
//         {
//             name: 'styles',
//             items: ['Font', 'FontSize']
//         },
//         {
//             name: 'colors',
//             items: ['TextColor', 'BGColor']
//         },
//         //{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
//         //{ name: 'insert', items: [ 'Image' ] } // , 'Table', 'HorizontalRule', 'SpecialChar'
//     ];
// };