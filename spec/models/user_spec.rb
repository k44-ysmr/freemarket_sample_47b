require 'rails_helper'

describe User do
  describe '#create' do
  	context "can save" do
	  it "is valid without a nickname, email, password and password_confirmation" do
	    user = build(:user)
	    expect(user).to be_valid
	  end
	end

    context "can not save" do
      it "is invalid without nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("入力してください")
      end
      it "is invalid without email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("入力してください")
      end
      it "is invalid without password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("入力してください")
      end
      it "is invalid without password_confirmation" do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("入力してください")
      end
      it "is invalid with not unique email" do
        email = Faker::Internet.email
        user1 = create(:user, email: email)
        user2 = build(:user, email: email)
        user2.valid?
        expect(user2.errors[:email]).to include("メールアドレスに誤りがあります。ご確認いただき、正しく変更してください。")
      end
      it "is invalid with different password" do
        user = build(:user, password: Faker::Lorem.characters(8), password: Faker::Lorem.characters(9))
        user.valid?
        expect(user.errors[:password_confirmation]).to include("パスワードとパスワード（確認）が一致しません")
      end
      it "is invalid with nickname(21 characters)" do
        user = build(:user, nickname: Faker::Lorem.characters(21))
        user.valid?
        expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
      end
      it "is invalid with password(5 characters)" do
        password = Faker::Lorem.characters(5)
        user = build(:user, password: password, password_confirmation: password)
        user.valid?
        expect(user.errors[:password]).to include("パスワードは6文字以上128文字以下で入力してください")
      end
      it "is invalid with password(129 characters)" do
        password = Faker::Lorem.characters(129)
        user = build(:user, password: password, password_confirmation: password)
        user.valid?
        expect(user.errors[:password]).to include("パスワードは6文字以上128文字以下で入力してください")
      end
    end
  end
end