require 'test_helper'

class BugTest < ActiveSupport::TestCase
  test "should not save bug without title" do
    bug = Bug.new
    bug.description = "Description"
    bug.issue_type = "Feature"
    bug.priority = "Low"
    bug.status = "Open"
    assert_not bug.save, "Saved the bug without a title"
  end

  test "should not save bug without description" do
    bug = Bug.new
    bug.title = "Title"
    bug.issue_type = "Feature"
    bug.priority = "Low"
    bug.status = "Open"
    assert_not bug.save, "Saved the bug without a description"
  end

  test "should not save bug without issue type" do
    bug = Bug.new
    bug.title = "Title"
    bug.description = "Description"
    bug.priority = "Low"
    bug.status = "Open"
    assert_not bug.save, "Saved the bug without a description"
  end

  test "should not save bug without priority" do
    bug = Bug.new
    bug.title = "Title"
    bug.description = "Description"
    bug.issue_type = "Feature"
    bug.status = "Open"
    assert_not bug.save, "Saved the bug without a description"
  end

  test "should not save bug without status" do
    bug = Bug.new
    bug.title = "Title"
    bug.description = "Description"
    bug.issue_type = "Feature"
    bug.priority = "Low"
    assert_not bug.save, "Saved the bug without a description"
  end

  test "should not save bug invalid issue type" do
    bug = Bug.new
    bug.title = "Title"
    bug.description = "Description"
    bug.issue_type = "Feature-Bad"
    bug.priority = "Low"
    bug.status = "Open"
    assert_not bug.save, "Saved the bug without a description"
  end

  test "should not save bug invalid priority" do
    bug = Bug.new
    bug.title = "Title"
    bug.description = "Description"
    bug.issue_type = "Feature"
    bug.priority = "Low-Bad"
    bug.status = "Open"
    assert_not bug.save, "Saved the bug without a description"
  end

  test "should not save bug invalid status" do
    bug = Bug.new
    bug.title = "Title"
    bug.description = "Description"
    bug.issue_type = "Features"
    bug.priority = "Low"
    bug.status = "Open-Bad"
    assert_not bug.save, "Saved the bug without a description"
  end
end
