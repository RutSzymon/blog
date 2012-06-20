require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = FactoryGirl.build(:comment)
  end

  test "it should save valid object" do
    assert @comment.save
  end

  test "it shouldn't save without body" do
    @comment.body = ""
    assert @comment.invalid?
  end

  test "it shouldn't save without article" do
    @comment.article = nil
    assert @comment.invalid?
  end

  test "it shouldn't save without user" do
    @comment.user = nil
    assert @comment.invalid?, "powinno nie zapisac, a zapisanop"
  end
end
