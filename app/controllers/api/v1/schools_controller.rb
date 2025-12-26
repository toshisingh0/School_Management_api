class Api::V1::SchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_school, only: [:create]


  def create
  school = School.new(school_params)
  school.admin = current_user
  school.save!

  render json: school, status: :created
  end

  private

  def school_params
    params.require(:school).permit(:name, :address)
  end

  def authorize_school
    authorize School
  end  


end
