require 'rails_helper'

RSpec.feature "Events", type: :feature do
  scenario 'user creates a new event' do
    create(:venue)
    user = create(:user)

    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect {
      click_link 'New Event'
      fill_in 'Name', with: 'Ghost'
      fill_in 'Date and time', with: '09/20/2019 6:52 PM'
      fill_in 'Description', with: 'World Church Burning Tour'
      select 'Reggies Rock Club', from: 'event[venue_id]'
      click_button 'Create Event'

      # save_and_open_page

      expect(page).to have_content "Event was successfully created."
    }.to change(user.events, :count).by(1)
  end
end
