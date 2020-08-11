require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = Event.new(title: 'Event', description: 'description')
  end

  test 'event should be valid' do
    assert_not @event.valid?
  end

  test 'title and description should be present' do
    @event.title = ''
    @event.description = ''
    assert_not @event.valid?
  end

  test 'title should not be too short' do
    @event.title = 'aaa'
    assert_not @event.valid?
  end

  test 'description should not be too short' do
    @event.description = 'aaaa'
    assert_not @event.valid?
  end
end
