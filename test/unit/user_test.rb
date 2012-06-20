require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = FactoryGirl.build(:user)
  end

  test "it should save valid object" do
    assert @user.save
  end

  test "it shouldn't save without email" do
    @user.email = nil
    assert @user.invalid?
  end

  test "it shouldn't save without password" do
    @user.password = nil
    assert @user.invalid?
  end

  test "it shouldn't save if password != password_confirmation" do  
    @user.password_confirmation = "factory1"
    assert @user.invalid?
  end

  test "it shouldn't save when email doesn't have correctly format" do  
    @user.email = "example"
    assert @user.invalid?
  end

  test "it shouldn't save when email isn't unique" do  
    @user.save
    @user2 = @user.dup
    assert @user2.invalid?
  end

end
