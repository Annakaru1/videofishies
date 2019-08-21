class Instructor::SectionsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @sections = Section.new
  end  
end
