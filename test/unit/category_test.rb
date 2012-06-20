require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = FactoryGirl.build(:category)
  end

  test "it shouldn't save without title" do
    @category.title = nil
    assert @category.invalid?
  end
end
