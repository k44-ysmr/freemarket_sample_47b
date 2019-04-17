crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link 'マイページ', user_path(current_user.id)
  parent :root
end

crumb :mypage_logout do
  link 'ログアウト', logouts_path
  parent :mypage
end

crumb :mypage_listing do
  link '出品した商品-出品中', listings_path
  parent :mypage
end

crumb :mypage_progression do
  link '出品した商品-取引中', progressions_path
  parent :mypage
end

crumb :mypage_completion do
  link '出品した商品-売却済', completions_path
  parent :mypage
end

crumb :mypage_purchase do
  link '購入した商品-取引中', purchases_path
  parent :mypage
end

crumb :mypage_purchased do
  link '出品した商品-過去の取引', purchased_index_path
  parent :mypage
end

crumb :mypage_profile do
  link 'プロフィール', user_profile_path
  parent :mypage
end

crumb :mypage_credit_card do
  link '支払い方法', new_credit_card_path
  parent :mypage
end

crumb :mypage_identification do
  link '本人情報', identifications_path
  parent :mypage
end

crumb :item do |item|
  link "#{item.name}", item_path(item)
  parent :root
end

crumb :search do |query|
  link "#{query}", search_index_path
  parent :root
end

crumb :category do
  link 'カテゴリー一覧', category_index_path
  parent :root
end

crumb :brand do
  link 'ブランド一覧', brand_index_path
  parent :root
end

crumb :brand_show do |top|
  link "#{brand.name}", brand_path(brand)
  parent :brand
end