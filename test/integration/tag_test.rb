#encoding: utf-8
require 'test_helper'

class TagTest < ActionDispatch::IntegrationTest

  setup do
    FactoryGirl.create(:article)
  end

  test "it should have title" do
    visit tags_path
    within(".span9") do
      assert page.has_content?("Tresc")
    end
  end

  test "it should have article" do
    visit tags_path
    within(".span9") do
      click_link("Tresc")
    end
    assert page.has_content?("Tytul")
  end

  test "article should have tags" do
    visit root_path
    click_link("zobacz artykuł")
    within(".span9") do
      assert page.has_content?("Factory")
    end
  end

  test "tag in article should show all articles with this tag" do
    visit root_path
    click_link("zobacz artykuł")
    within(".span9") do
      click_link("Factory")
    end
    assert page.has_content?("Tytul")
  end

  test "tag in tags cloud should show all articles with this tag" do
      visit root_path
      within(".span3") do
        click_link("Factory")
      end
      assert page.has_content?("Tytul")
    end

  test "tags cloud should be displayed on each page" do
    visit root_path
    within(".span3") do
      assert page.has_content?("Factory")
    end

    visit categories_path
    within(".span3") do
      assert page.has_content?("Factory")
    end

    visit top_articles_path
    within(".span3") do
      assert page.has_content?("Factory")
    end
  end

end
