require 'rails_helper'

RSpec.describe 'Events Controller', type: :feature do
  before(:each) do
    User.create(name: 'Abror')
    Event.create(title: 'title', description: 'description', date: Time.now, creator_id: 1)
    visit '/login'
    fill_in :name, with: 'Abror'
    click_button 'Log In'
  end

  it 'should create a new event and redirect to user\'s page' do
    visit '/events/new'
    fill_in 'event[title]', with: 'Jamaican Champs'
    fill_in 'event[description]', with: 'One more time world champs'
    fill_in 'event[date]', with: '02/01/2021'
    click_button 'Create Event'
    expect(page).to have_content('You have successfully created a new event!')
    expect(page).to have_link('Back to Profile', href: '/users/1')
  end
end
