require 'test_helper'

class TopTest < ActiveSupport::TestCase

  setup do
    @article = FactoryGirl.create(:article)
  end

  test "it should show the most commented post on the first position" do
    @article2 = FactoryGirl.create(:article)
    @article3 = FactoryGirl.create(:article)

    2.times{FactoryGirl.create(:comment, article: @article2)}
    FactoryGirl.create(:comment, article: @article3)

    assert_equal [@article2, @article3, @article], Article.top(3)
  end
end