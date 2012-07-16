#encoding: utf-8
require 'test_helper'

class CommentTest < ActionDispatch::IntegrationTest

  setup do
    @user = FactoryGirl.create(:user, email: "factory@factory.com")
     FactoryGirl.create(:comment)
  end

  test "article should have a comment" do
    visit root_path
    click_link("zobacz artykuł")
    assert page.has_content?("text")
  end

  test "it should show a form for logged in user" do
    visit root_path
    click_link("Sign in")
    fill_in("Email", :with => "factory@factory.com")
    fill_in("Password", :with => "factory")
    click_button("Sign in")

    click_link("zobacz artykuł")
    assert page.has_selector?("#new_comment")
  end

  test "it shouldn't show a form for anonymous user" do
    visit root_path
    click_link("zobacz artykuł")
    assert page.has_no_selector?("#new_comment")
  end

  test "it should save a comment" do
    visit root_path
    click_link("Sign in")
    fill_in("Email", :with => "factory@factory.com")
    fill_in("Password", :with => "factory")
    click_button("Sign in")
    click_link("zobacz artykuł")
    fill_in("comment_body", :with => "Nowy")
    click_button("Create Comment")
    assert page.has_content?("Nowy")
  end
end
