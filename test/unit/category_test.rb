require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = FactoryGirl.build(:category)
  end

  test "it should save valid object" do
    assert @category.save
  end

  test "it shouldn't save without title" do
    @category.title = nil
    assert @category.invalid?
  end

  test "it should have many articles" do
    @article = FactoryGirl.create(:article, category: @category)
    assert_equal [@article], @category.articles
  end
end
