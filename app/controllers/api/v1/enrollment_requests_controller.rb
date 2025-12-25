class Api::V1::EnrollmentRequestsController < ApplicationController
  before_action :authenticate_user!

 def index
    enrollments =
      if current_user.student?
        EnrollmentRequest
          .where(user_id: current_user.id)
          .includes(:batch)
          .order(created_at: :desc)

      elsif current_user.school_admin?
        EnrollmentRequest
          .joins(:batch)
          .where(batches: { school_id: current_user.school_id })
          .includes(:user, :batch)
          .order(created_at: :desc)

      else
        return render json: { error: 'Unauthorized' }, status: :forbidden
      end

    render json: enrollments, status: :ok
  end

  def create
    batch = Batch.find_by(id: params[:batch_id])
    return render json: { error: 'Batch not found' },
                  status: :unprocessable_entity unless batch

    if EnrollmentRequest.exists?(
      user_id: current_user.id,
      batch_id: batch.id,
      request_status: :pending
    )
      return render json: { error: 'Enrollment request already exists' },
                    status: :unprocessable_entity
    end

    EnrollmentRequest.create!(
      user_id: current_user.id,
      batch_id: batch.id,
      request_status: :pending
    )

    render json: { message: 'Enrollment request sent' }, status: :created
  end


   def approve
    enrollment = EnrollmentRequest.find_by(id: params[:id])
    return render json: { error: 'Enrollment not found' }, status: :not_found unless enrollment

    authorize enrollment, :approve?

    if enrollment.approved?
      return render json: { message: 'Enrollment already approved' }, status: :ok
    end

    EnrollmentRequest.transaction do
      enrollment.update!(request_status: :approved)
      BatchStudent.create!(
        user_id: enrollment.user_id,
        batch_id: enrollment.batch_id
      )
    end

    render json: { message: 'Enrollment approved' }, status: :ok

  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end


  def reject
  enrollment = EnrollmentRequest.find_by(id: params[:id])
  return render json: { error: 'Enrollment not found' }, status: :not_found unless enrollment

  authorize enrollment, :approve?  # ya :reject? policy define karo

  if enrollment.rejected?
    return render json: { message: 'Enrollment already rejected' }, status: :ok
  end

  enrollment.update!(request_status: :rejected)

  render json: { message: 'Enrollment rejected' }, status: :ok

  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

end
