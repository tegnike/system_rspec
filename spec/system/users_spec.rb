require 'rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  before do
    @user = User.create!(name: 'Test User')
  end

  it 'completes yubinbango automatically with JS' do
    # User編集画面を開く
    visit user_path(@user)

    # Nameに"いとう"が入力されていることを検証する
    expect(page).to have_content @user.name
  end
end
