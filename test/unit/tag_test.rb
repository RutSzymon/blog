require 'test_helper'

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = FactoryGirl.build(:tag)
  end

  test "it should save valid object" do
    assert @tag.save
  end

  test "it shouldn't save without title" do
    @tag.title = nil
    assert @tag.invalid?
  end

  test "it should have many articles" do
    @article = FactoryGirl.create(:article, tags: [@tag])
    assert_equal [@article], @tag.articles
  end

  test "it should save tags" do
    @tag_1 = FactoryGirl.create(:tag)
    @tag_2 = FactoryGirl.create(:tag)

    @article = FactoryGirl.create(:article, :tags => [@tag_1, @tag_2])

    @article.tags.include?(@tag_1)
    @article.tags.include?(@tag_2)
  end
end
