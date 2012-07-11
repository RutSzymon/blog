#encoding: utf-8
require 'test_helper'

class UserTest < ActionDispatch::IntegrationTest

  setup do
    FactoryGirl.create(:user)
  end

  test "it should log in user correctly" do
    visit root_path
    click_link("Sign in")
    fill_in("Email", :with => "factory@factory.com")
    fill_in("Password", :with => "factory")
    click_button("Sign in")
    assert page.has_content?("Sign out")
  end

  test "it shouldn't log user with incorrect password" do
    visit root_path
    click_link("Sign in")
    fill_in("Email", :with => "factory@factory.com")
    fill_in("Password", :with => "password")
    click_button("Sign in")
    assert page.has_content?("Sign in")
  end

  test "it shouldn't log user with incorrect email" do
    visit root_path
    click_link("Sign in")
    fill_in("Email", :with => "wrong@factory.com")
    fill_in("Password", :with => "factory")
    click_button("Sign in")
    assert page.has_content?("Sign in")
  end

  test "it should log out user correctly" do 
    visit root_path
    click_link("Sign in")
    fill_in("Email", :with => "factory@factory.com")
    fill_in("Password", :with => "factory")
    click_button("Sign in")
    click_link("Sign out")
    assert page.has_content?("Sign in")
  end
end
