require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @note = FactoryGirl.build(:article)
  end

  test "it should save valid object" do
    assert @note.save
  end

  test "it should save without body" do
    @note.body = ""
    assert @note.save
  end

  test "it shouldn't save article without title" do
    @note.title = nil
    assert @note.invalid?
  end

  test "it shouldn't save article without summary" do
    @note.summary = nil
    assert @note.invalid?
  end
end
