class Api::V1::BatchesController < ApplicationController
  before_action :authenticate_user!

  def create
    course = Course.find_by(id: batch_params[:course_id])
    return render json: { error: "Course not found" }, status: :unprocessable_entity unless course

    @batch = Batch.new(batch_params)
    @batch.course = course

    if @batch.save
      render json: @batch, status: :created
    else
      render json: { errors: @batch.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def batch_params
    params.require(:batch).permit(:name, :course_id, :start_date, :end_date)
  end
end
