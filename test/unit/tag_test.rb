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
end
