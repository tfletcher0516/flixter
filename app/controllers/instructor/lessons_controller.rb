class Instructor::LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorized_for_current_session
	def new
			if current_section.course.user != current_user
				return render :text => 'Unauthorized', :status => :unauthorized
			end
		@lesson = Lesson.new
	end

	def create
		if current_section.course.user != current_user
			return render :text=> 'Unauthorized', :status => :unauthorized
		end
		@lesson = current_section.lessons.create(lesson_params)
		redirect_to instructor_course_path(current_section.course)
	end

	private
	helper_method :current_section
	def current_section
		@current_section ||= Section.find(:section_id)

	def lesson_params
		params.require(:lesson).permit(:title, :subtitle)
	end
end
