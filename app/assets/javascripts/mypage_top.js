$(document).on('turbolinks:load', function(){

$(function() {

// ボーダーを表示する(画面遷移時)
  $('.mainbox__main-contents__contents-tab__menu__left').addClass('red-border');

// お知らせボタンを押した時
  $('.mainbox__main-contents__contents-tab__menu__right').on('click', function() {

// ２回以上押した時に複数出てこないようにするために元の要素を消す
    $('.mainbox__main-contents__contents-tab__box').remove();
    $('.mainbox__main-contents__contents-tab__box2').remove();
    $('.mainbox__main-contents__list').remove();
        $('.mainbox__main-contents__contents-tab__menu__right').removeClass('gray');
    $('.mainbox__main-contents__contents-tab__menu__left').removeClass('white');
    $('.mainbox__main-contents__contents-tab__menu__right').removeClass('red-border');
    $('.mainbox__main-contents__contents-tab__menu__left').removeClass('red-border');

// urlを追加する
    $('.mainbox__main-contents__contents-tab').append(`
      <div class="mainbox__main-contents__contents-tab__box2">
        <div class="mainbox__main-contents__contents-tab__box2__image-box"></div>
        <div class="mainbox__main-contents__contents-tab__box2__image"></div>
        <div class="mainbox__main-contents__contents-tab__box2__text">現在、やることリストはありません</div>
      </div>`);

// ボタンの背景色を逆にする
    $('.mainbox__main-contents__contents-tab__menu__right').addClass('white');
    $('.mainbox__main-contents__contents-tab__menu__left').addClass('gray');

// ボーダーを表示する
    $('.mainbox__main-contents__contents-tab__menu__right').addClass('red-border');

  });


// やることリストボタンを押した時
  $('.mainbox__main-contents__contents-tab__menu__left').on('click', function() {

// ２回以上押した時に複数出てこないようにするために元の要素を消す
    $('.mainbox__main-contents__contents-tab__box').remove();
    $('.mainbox__main-contents__list').remove();
    $('.mainbox__main-contents__contents-tab__box2').remove();
    $('.mainbox__main-contents__contents-tab__menu__right').removeClass('white');
    $('.mainbox__main-contents__contents-tab__menu__left').removeClass('gray');
    $('.mainbox__main-contents__contents-tab__menu__right').removeClass('red-border');
    $('.mainbox__main-contents__contents-tab__menu__left').removeClass('red-border');


// urlを追加する
    $('.mainbox__main-contents__contents-tab').append(`
      <a href="/users/show"><div class="mainbox__main-contents__contents-tab__box">
        <div class="mainbox__main-contents__contents-tab__box__icon"></div>
        <div class="mainbox__main-contents__contents-tab__box__text">お知らせお知らせ</div>
        <div class="mainbox__main-contents__contents-tab__box__time">1時間前</div>
        <i2 class="far fa-clock"></i2>
        <i3 class="fa fa-chevron-right"></i3>
        </div>
      </a>
      <a href="/users/show"><div class="mainbox__main-contents__contents-tab__box">
        <div class="mainbox__main-contents__contents-tab__box__icon"></div>
        <div class="mainbox__main-contents__contents-tab__box__text">お知らせお知らせ</div>
        <div class="mainbox__main-contents__contents-tab__box__time">1時間前</div>
        <i2 class="far fa-clock"></i2>
        <i3 class="fa fa-chevron-right"></i3>
        </div>
      </a>
      <a href="/users/show"><div class="mainbox__main-contents__contents-tab__box">
        <div class="mainbox__main-contents__contents-tab__box__icon"></div>
        <div class="mainbox__main-contents__contents-tab__box__text">お知らせお知らせ</div>
        <div class="mainbox__main-contents__contents-tab__box__time">1時間前</div>
        <i2 class="far fa-clock"></i2>
        <i3 class="fa fa-chevron-right"></i3>
        </div>
      </a>
      <a href="/users/show"><div class="mainbox__main-contents__contents-tab__box">
        <div class="mainbox__main-contents__contents-tab__box__icon"></div>
        <div class="mainbox__main-contents__contents-tab__box__text">お知らせお知らせ</div>
        <div class="mainbox__main-contents__contents-tab__box__time">1時間前</div>
        <i2 class="far fa-clock"></i2>
        <i3 class="fa fa-chevron-right"></i3>
        </div>
      </a>
      <a href="/users/show"><div class="mainbox__main-contents__contents-tab__box">
        <div class="mainbox__main-contents__contents-tab__box__icon"></div>
        <div class="mainbox__main-contents__contents-tab__box__text">お知らせお知らせ</div>
        <div class="mainbox__main-contents__contents-tab__box__time">1時間前</div>
        <i2 class="far fa-clock"></i2>
        <i3 class="fa fa-chevron-right"></i3>
        </div>
      </a>
      <div class="mainbox__main-contents__list">
        <div class="mainbox__main-contents__list__list-space"></div>
        <a href="/users/show"><div class="mainbox__main-contents__list__list-btn">一覧を見る</div>
        </a>
      </div>
    `);

// ボタンの背景色を逆にする
    $('.mainbox__main-contents__contents-tab__menu__right').addClass('gray');
    $('.mainbox__main-contents__contents-tab__menu__left').addClass('white');

// ボーダーを表示する
    $('.mainbox__main-contents__contents-tab__menu__left').addClass('red-border');
  });

});

});
