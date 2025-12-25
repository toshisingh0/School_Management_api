class Api::V1::CoursesController < ApplicationController
  before_action :authenticate_user!


  def create
    course = Course.new(course_params)
    course.school = current_user.school
    if course.save
      render json: course, status: :created
    else
      render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

  def course_params
    params.require(:course).permit(:name, :description)
  end

end
