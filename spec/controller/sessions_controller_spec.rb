require 'rails_helper'

RSpec.describe 'Sessions Controller', type: :feature do
  before(:each) do
    User.create(name: 'Abror')
  end

  it 'should log in and redirects to current user\'s page' do
    visit '/login'
    fill_in :name, with: 'Abror'
    click_button 'Log In'
    expect(page).to have_content('MY EVENTS')
  end

  it 'should give an error message if invalid name entered' do
    visit '/login'
    fill_in :name, with: 'Dilafroz'
    click_button 'Log In'
    expect(page).to have_content('Invalid name entered!')
  end

  it 'should log out the current user and redirect to the homepage' do
    visit '/login'
    fill_in :name, with: 'Abror'
    click_button 'Log In'
    sleep(2)
    click_link 'Log Out'
    expect(ApplicationController.session_user_id_to_test).to eq(nil)
  end
end
