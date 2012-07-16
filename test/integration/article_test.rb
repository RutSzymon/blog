#encoding: utf-8
require 'test_helper'

class ArticleTest < ActionDispatch::IntegrationTest
  setup do
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
end
