require 'rails_helper'

RSpec.describe Menu, type: :model do
  before do
    @user = User.create(nickname: 'テストユーザー')
    @menu = FactoryBot.build(:menu)
  end
  describe 'レシピ投稿機能' do
    it 'nameが空では登録できない' do    
      @menu.name = ''
      @menu.valid?
      expect(@menu.errors.full_messages).to include("レシピ名を入力してください")
    end
    it 'urlが空では登録できない' do
      @menu.url = ''
      @menu.valid?
      binding.pry
      expect(@menu.errors.full_messages).to include("URLを入力してください")
    end
  end
end
