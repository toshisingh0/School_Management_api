class Api::V1::BatchesController < ApplicationController
  def create
    authorize Batch
    batch = Batch.create!(batch_params)
    render json: batch, status: :created
  end

  private

  def batch_params
    params.require(:batch).permit(:name, :course_id, :start_date, :end_date)
  end
end
