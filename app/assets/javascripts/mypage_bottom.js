$(document).on('turbolinks:load', function(){

$(function() {

// ボーダーを表示する(画面遷移時)
  $('.mainbox__main-contents__contents-tab__menu__left2').addClass('red-border');

// お知らせボタンを押した時
  $('.mainbox__main-contents__contents-tab__menu__right2').on('click', function() {

// ２回以上押した時のために元の要素を消す
    $('.mainbox__main-contents__contents-tab__menu__right2').removeClass('gray');
    $('.mainbox__main-contents__contents-tab__menu__left2').removeClass('white');
    $('.mainbox__main-contents__contents-tab__menu__right2').removeClass('red-border');
    $('.mainbox__main-contents__contents-tab__menu__left2').removeClass('red-border');
    $('.mainbox__main-contents__item-tab__text').remove()
// urlを追加する
    $('.mainbox__main-contents__item-tab').append(`
        <div class="mainbox__main-contents__item-tab__text">過去の取引がありません</div>`);

// ボタンの背景色を逆にする
    $('.mainbox__main-contents__contents-tab__menu__right2').addClass('white');
    $('.mainbox__main-contents__contents-tab__menu__left2').addClass('gray');

// ボーダーを表示する
    $('.mainbox__main-contents__contents-tab__menu__right2').addClass('red-border');
  });

// やることリストボタンを押した時
  $('.mainbox__main-contents__contents-tab__menu__left2').on('click', function() {

// ２回以上押した時のために元の要素を消す
    $('.mainbox__main-contents__contents-tab__menu__right2').removeClass('white');
    $('.mainbox__main-contents__contents-tab__menu__left2').removeClass('gray');
    $('.mainbox__main-contents__contents-tab__menu__right2').removeClass('red-border');
    $('.mainbox__main-contents__contents-tab__menu__left2').removeClass('red-border');
    $('.mainbox__main-contents__item-tab__text').remove();

// urlを追加する
    $('.mainbox__main-contents__item-tab').append(`
        <div class="mainbox__main-contents__item-tab__text">取引中の商品がありません</div>`);

// ボタンの背景色を逆にする
    $('.mainbox__main-contents__contents-tab__menu__right2').addClass('gray');
    $('.mainbox__main-contents__contents-tab__menu__left2').addClass('white');

// ボーダーを表示する
    $('.mainbox__main-contents__contents-tab__menu__left2').addClass('red-border');
  });
});

});
