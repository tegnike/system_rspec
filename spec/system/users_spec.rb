require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = User.create!(name: 'いとう')
  end

  it 'completes yubinbango automatically with JS' do
    # User編集画面を開く
    visit edit_user_path(@user)

    # Nameに"いとう"が入力されていることを検証する
    expect(page).to have_field '名前', with: 'いとう'
  end
end
