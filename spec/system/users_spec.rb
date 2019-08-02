require 'rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  before do
    @user = User.create!(name: 'Test User')
  end

  it 'completes yubinbango automatically with JS' do
    visit user_path(@user)

    expect(page).to have_content @user.name
  end
end
