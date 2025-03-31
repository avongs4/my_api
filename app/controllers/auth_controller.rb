class AuthController < ApplicationController
    def signup
      user = User.new(user_params)
      if user.save
        render json: { message: 'User created successfully' }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def login
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        token = Doorkeeper::AccessToken.create!(resource_owner_id: user.id, expires_in: 2.hours, scopes: '')
        render json: { message: 'Login successful', token: token.token, expires_at: token.expires_in }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
  end
  