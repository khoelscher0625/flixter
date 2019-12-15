class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def show
  end

private

helper_method :current_lesson
  def current_lesson
    @current_lesson ||=Lesson.find(params[:id])
  end

  def require_authorized_for_current_lesson
    if current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path, alert: 'You must be enrolled to view this content'
    end
  end

end

