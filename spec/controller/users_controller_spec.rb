require 'rails_helper'

RSpec.describe 'Users Controller', type: :feature do
  before(:each) do
    User.create(name: 'Abror')
    visit '/login'
    fill_in 'name', with: 'Abror'
    click_button 'Log In'
  end

  describe 'GET /user/1' do
    it 'should find user id with the name \'Abror\'' do
      visit user_path(1)
      expect(page).to have_content 'Abror'
    end

    it 'should find the text \'MY EVENTS\'' do
      visit user_path(1)
      expect(page).to have_content('MY EVENTS')
    end

    it 'should find the text \'UPCOMING EVENTS\'' do
      visit user_path(1)
      expect(page).to have_content('UPCOMING EVENTS')
    end

    it 'should find the text \'PAST EVENTS\'' do
      visit user_path(1)
      expect(page).to have_content('PAST EVENTS')
    end

    it 'should go to the link events/new to create a new event' do
      visit user_path(1)
      expect(page).to have_link('Create Event', href: '/events/new')
    end

    it 'should log out the current user' do
      visit user_path(1)
      click_link 'Log Out'
      expect(page).to have_content('You have successfully logged out!')
    end
  end
end
