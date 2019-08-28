class CoursesController < ApplicationController
  def index
    @courses = Course.new
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.find(params[:image_id])
    @course.images.create(image_params.merge(user: current_user))
    redirect_to image_path(@image)
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :cost, :image)
  end
end
