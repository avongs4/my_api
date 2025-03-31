module Api
    module V1
      class UsersController < ApplicationController
        def create
          Rails.logger.info "Received Params: #{params.inspect}"  # Logs the entire request params
  
          user = User.new(user_params)
  
          if user.save
            render json: { message: "User created successfully" }, status: :created
          else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        private
  
        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
      end
    end
  end
  