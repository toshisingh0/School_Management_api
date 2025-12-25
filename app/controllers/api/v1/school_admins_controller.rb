class Api::V1::SchoolAdminsController < ApplicationController
  before_action :authenticate_user!

  def create
  @school_admin = SchoolAdmin.new(school_admin_params)
  if @school_admin.save
    render json: { status: 'success', data: @school_admin }, status: :created
  else
    render json: { status: 'error', errors: @school_admin.errors.full_messages }, status: :unprocessable_entity
  end
  end


  private

  def school_admin_params
  params.require(:school_admin).permit(:name, :email, :password, :school_id)
  end

end
