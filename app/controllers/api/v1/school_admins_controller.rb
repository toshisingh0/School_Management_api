class Api::V1::SchoolAdminsController < ApplicationController
  # def create
  # authorize :school_admin

  # school_admin = SchoolAdmin.new(
  #   name: params[:name],
  #   email: params[:email],
  #   password: params[:password],
  #   school_id: params[:school_id],
  # )

  # if school_admin.save
  #   render json: school_admin, status: :created
  # else
  #   render json: { errors: school_admin.errors.full_messages }, status: :unprocessable_entity
  # end
  # end

  def create
  @school_admin = SchoolAdmin.new(school_admin_params)
  if @school_admin.save
    render json: { status: 'success', data: @school_admin }, status: :created
  else
    # This line is crucial for debugging the ROLLBACK
    render json: { status: 'error', errors: @school_admin.errors.full_messages }, status: :unprocessable_entity
  end
  end


  private

  def school_admin_params
  params.require(:school_admin)
        .permit(:name, :email, :password, :school_id)
  end



 



end
