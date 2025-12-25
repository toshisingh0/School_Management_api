class Api::V1::StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_student

  def classmates
    batch = current_user.batches.first
    unless batch
      return render json: { error: "You are not assigned to any batch" }, status: :not_found
    end

    classmates = batch.users.where(role: User.roles[:student]).where.not(id: current_user.id)

    render json: {
      batch_name: batch.name,
      classmates: classmates.select(:id, :name, :email)
    }
  end

  def progress
    batch = current_user.batches.first
    return render json: { error: "No batch found" }, status: :not_found unless batch
    total_students = batch.users.count
    classmates_count = total_students - 1 # excluding current student

    render json: {
      batch_name: batch.name,
      your_id: current_user.id,
      classmates_count: classmates_count,
      total_students: total_students
    }
  end

  private

  def ensure_student
    render json: { error: "Not authorized" }, status: :forbidden unless current_user.student?
  end
end
