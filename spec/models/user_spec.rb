require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録dけいないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it 'nicknameが7文字以上では登録できない' do
        @user.nickname = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameは6文字以内で入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        existing_user = FactoryBot.create(:user, email: 'test@example.com')
        @user.email = 'test@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailはすでに存在します")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailは不正な値です")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは6文字以上で入力してください")
      end
      it 'passwordが129文字以上では登録できない' do
        long_password = SecureRandom.hex(65)
        @user.password = long_password
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは128文字以内で入力してください")
      end
    end
  end
end
