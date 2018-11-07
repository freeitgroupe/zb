/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'en';
    config.allowedContent = true;
	// config.uiColor = '#AADC6E';
	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	config.filebrowserBrowseUrl = 	   'http://zb.loc/admin/js/kcfinder/browse.php?opener=ckeditor&type=files';
    config.filebrowserImageBrowseUrl = 'http://zupplybox.com/admin/js/kcfinder/browse.php?opener=ckeditor&type=images';
    config.filebrowserFlashBrowseUrl = 'http://zupplybox.com/admin/js/kcfinder/browse.php?opener=ckeditor&type=flash';
    config.filebrowserUploadUrl =	   'http://zupplybox.com/admin/js/kcfinder/upload.php?opener=ckeditor&type=files';
    config.filebrowserImageUploadUrl = 'http://zupplybox.com/admin/js/kcfinder/upload.php?opener=ckeditor&type=images';
    config.filebrowserFlashUploadUrl = 'http://zupplybox.com/admin/js/kcfinder/upload.php?opener=ckeditor&type=flash';
    //config.removePlugins = 'flash';
    //config.removePlugins='html5upload,flashupload';
    //config.removeDialogTabs = 'link:upload;image:Upload';
};
