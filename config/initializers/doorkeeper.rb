Doorkeeper.configure do
  orm :active_record

  resource_owner_authenticator do
    User.find_by(id: session[:user_id]) || redirect_to(new_user_session_url)
  end
  #   User.find_by(id: session[:user_id]) || nil  # Allow unauthenticated users
  # end
  

  resource_owner_from_credentials do |_routes|
    user = User.find_for_authentication(email: params[:username])
    if user&.valid_password?(params[:password])
      user
    end
  end

  grant_flows %w[password client_credentials authorization_code]

  access_token_expires_in 2.hours
  use_refresh_token
end


