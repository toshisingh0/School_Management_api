class Api::V1::EnrollmentRequestsController < ApplicationController
  def create
  authorize EnrollmentRequest
  EnrollmentRequest.create!(
    user_id: current_user.id,
    batch_id: params[:batch_id],
    status: :pending
  )
  render json: { message: 'Enrollment request sent' }
  end

  def approve
    enrollment = EnrollmentRequest.find(params[:id])
    authorize enrollment, :approve?

    enrollment.update!(status: :approved)
    BatchStudent.create!(
      user_id: enrollment.user_id,
      batch_id: enrollment.batch_id
    )

    render json: { message: 'Enrollment approved' }
  end

  def reject
    enrollment = EnrollmentRequest.find(params[:id])
    authorize enrollment, :approve?
    enrollment.update!(status: :rejected)
    render json: { message: 'Enrollment rejected' }
  end
end
