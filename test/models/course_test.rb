require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Course Creation" do
  	course = FactoryGirl.create(:course)
  	refute_nil course
  	refute_nil course.user
  end

  test "Validates Cost as Provided" do
  	course = Course.new(title: "A title", description: "A description")
  	refute course.valid?
  end

end
