require 'test_helper'

class CategoryTest < ActionDispatch::IntegrationTest

  setup do
    FactoryGirl.create(:category)
  end

  test "it should have title" do
    visit categories_path
    assert page.has_content?("Nazwa")
  end

  test "it should have article" do
    @category = FactoryGirl.create(:category, title: "Kategoria")
    FactoryGirl.create(:article, category: @category)
    visit categories_path
    click_link("Kategoria")
    assert page.has_content?("Tytul")
  end

end
