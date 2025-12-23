class Api::V1::StudentsController < ApplicationController
  def classmates
    batch = current_user.batches.first
    students = batch.users.select(:id, :email)
    render json: students
  end

  def progress
    progress = Progress.where(batch_id: current_user.batches.first.id)
    render json: progress
  end
end
