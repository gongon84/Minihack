$(function() {

    // ファイルボタンでファイルを選択したとき
    $('.js-upload-file').on('change', function () { //ファイルが選択されたら
        var file = $(this).prop('files')[0]; //ファイルの情報を代入
        $('.js-upload-filename').text(file.name); //ファイル名を出力
        $('.js-upload-fileclear').show();
    });

    // クリアボタンをクリックしたとき
    $('.js-upload-fileclear').click(function() { //クリアボタンがクリックされたら
        $('.js-upload-file').val('');
        $('.js-upload-filename').text('ファイルが未選択です'); //ファイル名をリセット
        $(this).hide(); //クリアボタンを非表示
    });

    // 削除ボタンをクリックしたとき
    $('.js-destroy-file').click(function() {
        $('.js-upload-file').val('');
        $('.js-upload-filename').text('デフォルト画像');
        $(this).hide();
    });

});