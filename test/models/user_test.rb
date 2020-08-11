require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Abror')
  end

  test 'category should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'name should be unique' do
    @user.save
    user2 = User.new(name: 'Abror')
    assert_not user2.valid?
  end

  test 'name should not be too short' do
    @user.name = 'aaa'
    assert_not @user.valid?
  end
end
