#encoding: utf-8
require 'test_helper'

class ArticleTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryGirl.create(:user, email: "factory@factory.com")
    FactoryGirl.create(:article, title: "Tytul 1", summary: "wstep 1", body: "rozszerzenie 1")
    FactoryGirl.create(:article, title: "Tytul 2", summary: "wstep 2", body: "rozszerzenie 2")
  end


  test "it should have title and summary" do
    visit root_path
    assert page.has_content?("Tytul 1")
    assert page.has_content?("Tytul 2")
    assert page.has_content?("wstep 1")
    assert page.has_content?("wstep 2")
  end

  test "it shouldn't have body" do
    visit root_path
    assert page.has_no_content?("rozszerzenie 1")
    assert page.has_no_content?("rozszerzenie 2")
  end

  test "it should click link and have body" do
    visit root_path
    click_link("zobacz artykuł")
    assert page.has_content?("rozszerzenie 1")
  end

  test "it should paginate pages" do
    20.times{ FactoryGirl.create(:article) }
    visit root_path
    find(".last").click
    assert page.has_content?("wstep")
  end

  test "add article should show a form" do 
    visit root_path
    click_link("Sign in")
    fill_in("Email", :with => "factory@factory.com")
    fill_in("Password", :with => "factory")
    click_button("Sign in")
    click_link("Add article")
    assert page.has_button?("Create Article")
  end

  test "add article should add new article" do 
    visit root_path
    click_link("Sign in")
    fill_in("Email", :with => "factory@factory.com")
    fill_in("Password", :with => "factory")
    click_button("Sign in")
    click_link("Add article")
    fill_in("Title", :with => "Tytulnew")
    fill_in("Summary", :with => "Summarynew")
    fill_in("Body", :with => "Bodynew")
    select("Nazwa", :from => "Category")
    fill_in("Tag list", :with => "Tagnew")
    click_button("Create Article")
    assert page.has_button?("Create Comment")
  end
end
