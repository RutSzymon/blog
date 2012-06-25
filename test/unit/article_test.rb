require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = FactoryGirl.build(:article)
  end

  test "it should save valid object" do
    assert @article.save
  end

  test "it should save without body" do
    @article.body = ""
    assert @article.save
  end

  test "it shouldn't save article without title" do
    @article.title = nil
    assert @article.invalid?
  end

  test "it shouldn't save article without summary" do
    @article.summary = nil
    assert @article.invalid?
  end

  test "it should have many comments" do
    @comment = FactoryGirl.create(:comment, article: @article)
    assert_equal [@comment], @article.comments
  end

  test "it should belong to category" do
    category = FactoryGirl.create(:category)
    @article.category = category
    assert_equal category, @article.category
  end
end
