class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :items
  has_many :trading_partners
  has_many :credit_cards
  has_many :sns_credentials, dependent: :destroy

  # validates :nickname,
  #   presence: true,
  #   length: { maximum: 20 }
  # validates :email,
  #   presence: true,
  #   uniqueness: { message: "メールアドレスに誤りがあります。ご確認いただき、正しく変更してください。" },
  #   format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*[a-zA-Z]+\z/, allow_blank: true, message: "フォーマットが不適切です" }
  # validates :password,
  #   presence: true,
  #   confirmation: { message: "パスワードとパスワード（確認）が一致しません" },
  #   length: { in: 6..128, message: "パスワードは6文字以上128文字以下で入力してください" },
  #   format: { with: /\A(?=.*[^\d])+/, allow_blank: true, message: "数字のみのパスワードは設定できません" }
  # validates :password_confirmation,
  #   presence: true

  def self.from_auth(auth)
    uid = auth.uid
    provider = auth.provider
    sns = SnsCredential.where(uid: uid, provider: provider).first
    if sns.present?
      user = User.where(id: sns.user_id).first
    else
      user = User.create(
        nickname: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20]
        )
      SnsCredential.create(
        uid: uid,
        provider: provider,
        user_id: user.id
        )
    end
    return user
  end
end
