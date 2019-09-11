class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrollment_for_current_lesson

  def lesson
    @lesson = Lesson.new
  end

  def unknown
    @lesson = current_user.lesson.section.course(lesson_params)
    if @lesson.valid?
      redirect_to lesson_path(@lesson)
    else
      redirect_to course_enrollments_path(@course)
    end
  end

  def show
  end

  private

  def require_enrollment_for_current_lesson
   # if current_user.courses != current_user.enrolled_in?(@course)
     if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), alert: "You must be enrolled to view this lesson."
     # redirect_to course_enrollments_path(@course), alert: "You must be enrolled"
     # render plain: "You must be enrolled", status: :unauthorized
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end