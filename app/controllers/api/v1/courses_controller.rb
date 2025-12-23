class Api::V1::CoursesController < ApplicationController
  # before_action :authenticate_user!

  def create
  @course = Course.new(course_params)
  if @course.save
    render json: @course, status: :created
  else
    # This will print the exact errors to your terminal logs
    puts @course.errors.full_messages 
    render json: @course.errors, status: :unprocessable_entity
  end
  end

  private

  def course_params
   params.require(:course).permit(:name, :description, :school_id)
  end
end
