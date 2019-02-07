require 'test_helper'

class BugTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save bug without title" do
    bug = Bug.new
    assert_not bug.save, "Saved the bug without a title"
  end

  test "should not save bug without description" do
    bug = Bug.new
    assert_not bug.save, "Saved the bug without a description"
  end
end
