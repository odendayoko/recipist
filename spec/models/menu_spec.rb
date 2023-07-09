require 'rails_helper'

RSpec.describe Menu, type: :model do
  before do
    @menu = FactoryBot.build(:menu)
  end
  describe 'レシピ投稿' do
    context 'レシピが投稿できる場合' do
      it '料理名、URL、メモ、写真を投稿できる' do
        expect(@menu).to be_valid
      end
      it 'メモがなくても投稿できる' do
        @menu.memo = ''
        expect(@menu).to be_valid
      end
      it '写真がなくても投稿できる' do
        @menu.image = nil
        expect(@menu).to be_valid
      end
    end
    context 'レシピが投稿できない場合' do
      it '料理名が空では登録できない' do    
        @menu.name = ''
        @menu.valid?
        expect(@menu.errors.full_messages).to include("レシピ名を入力してください")
      end
      it 'URLが空では登録できない' do
        @menu.url = ''
        @menu.valid?
        expect(@menu.errors.full_messages).to include("URLを入力してください")
      end
      it 'ユーザーが紐づいていなければ投稿できない' do
        @menu.user = nil
        @menu.valid?
        expect(@menu.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
