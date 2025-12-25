class Api::V1::SchoolsController < ApplicationController
 
  def create
    school = School.new(school_params)
    school.admin_id = current_user.id
    school.save!
    render json: school, status: :created
  end

  private

  def school_params
    params.require(:school).permit(:name, :address, :admin_id)
  end
end
