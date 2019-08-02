require 'rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  it 'succcess CRUD' do
    visit users_path
    expect(page).to have_css('h1', text: 'Users')

    click_on 'New User'
    fill_in "Name", with: 'Created User'
    click_on 'Create User'

    expect(page).to have_content "User was successfully created."

    click_on 'Edit'
    fill_in "Name", with: 'Updated User'
    click_on 'Update User'

    expect(page).to have_content "User was successfully updated."

    click_on 'Back'
    click_on 'Show'
    expect(page).to have_content 'Updated User'

    click_on 'Back'

    expect(page).to have_css('h1', text: 'Users')
    expect(page).to have_css('td', text: 'Updated User')

    link = find_link 'Destroy'
    expect(link['data-confirm']).to eq 'Are you sure?'

    page.accept_confirm 'Are you sure?' do
      click_on 'Destroy'
    end

    expect(page).to have_css('h1', text: 'Users')
    expect(page).to have_no_css('td', text: 'Updated User')
  end
end
