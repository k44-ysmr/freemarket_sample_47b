class Category < ApplicationRecord
  has_many :items

  # self.data = [
  #     {id: 1, name: 'レディース'}, {id: 2, name: 'メンズ'}, {id: 3, name: 'キッズ'},
  #     {id: 4, name: 'インテリア'}
  # ]

  # enum first_category: {a: 1, "メンズ": 2, "ベビー・キッズ": 3, "インテリア・住まい・小物": 4, "本・音楽・ゲーム": 5, "おもちゃ・ホビーグッズ": 6}

  # enum second_category: {"ジャケット・アウター": 7, "トップス": 8, "パンツ": 9, "スカート": 10, "ワンピース": 11, "靴": 12}

  # enum third_category: {"Tシャツ/カットソー（半袖/袖なし）": 13, "Tシャツ/カットソー(７分/長袖)": 14, "シャツ": 15, "ホロシャツ": 16, "タンクトップ": 17}
end
