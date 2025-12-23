class ApplicationController < ActionController::API
  # include Pundit
  include Pundit::Authorization
  before_action :authenticate_user

  attr_reader :current_user

  def authenticate_user
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    decoded = JwtService.decode(token)
    @current_user = User.find_by(id: decoded[:user_id]) if decoded

    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  end

  # def authenticate_user
  #   header = request.headers['Authorization']
  #   return render json: { error: 'Missing token' }, status: :unauthorized unless header

  #   token = header.split(' ').last
  #   decoded = JwtService.decode(token)

  #   return render json: { error: 'Invalid token' }, status: :unauthorized unless decoded

  #   @current_user = User.find_by(id: decoded[:user_id])

  #   render json: { error: 'User not found' }, status: :unauthorized unless @current_user
  # end
end
