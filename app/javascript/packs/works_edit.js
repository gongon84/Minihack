$(function() {

    // プレビュー画像
    function readURL(input) {
        $('.img_prev').show(); //非表示のプレビュー画像を表示
        if (input.prop('files') && input.prop('files')[0]) {
          var reader = new FileReader(); 
          reader.onload = function (e) { //読み込みしたとき
            $('.img_prev').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.prop('files')[0]); //URLを格納
        }
    }

    // ファイルボタンでファイルを選択したとき
    $('.js-upload-file').on('change', function () { //ファイルが選択されたら
        var file = $(this).prop('files')[0]; //ファイルの情報を代入
        $('.js-upload-filename').text(file.name); //ファイル名を出力
        $('.js-upload-fileclear').show();
        readURL($('.js-upload-file'));
    });

    // クリアボタンをクリックしたとき
    $('.js-upload-fileclear').click(function() { //クリアボタンがクリックされたら
        $('.js-upload-filename').text('ファイルが未選択です'); //ファイル名をリセット
        $('.js-upload-file').val('');
        $(this).hide(); //クリアボタンを非表示
        $('.img_prev').hide(); //プレビュー画像を非表示
    });

    // 削除ボタンをクリックしたとき
    $('.js-destroy-file').click(function() {
        $('.js-upload-file').val('');
        $('.js-upload-filename').text('デフォルト画像');
        $(this).hide(); //削除ボタンを非表示
        $('.img_prev').hide(); //プレビュー画像を非表示
    });

});