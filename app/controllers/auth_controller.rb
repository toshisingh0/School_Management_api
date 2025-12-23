class AuthController < ApplicationController
  skip_before_action :authenticate_user
  # skip_before_action :verify_authenticity_token, raise: false 
  wrap_parameters false 

  # SIGNUP (tumhara existing)
  def signup
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    # 3. Direct params access (permit zaroori hai safety ke liye)
    email = params[:email]
    password = params[:password]

    if email.blank? || password.blank?
      render json: { 
        error: 'Missing email or password',
        received_keys: params.keys # Debugging ke liye
      }, status: :bad_request
      return
    end

    user = User.find_by(email: email)

    if user&.authenticate(password)
      token = JwtService.encode(user_id: user.id, role: user.role)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end




  private

  def user_params
    params.require(:auth).permit(:email, :password, :role)
  end

  def auth_params
  params.require(:auth).permit(:email, :password)
  end

end
