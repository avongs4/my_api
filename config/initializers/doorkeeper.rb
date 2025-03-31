# Doorkeeper.configure do
#   orm :active_record

#   # Authenticate user before issuing access tokens
#   resource_owner_authenticator do
#     current_user = User.find_by(id: params[:user_id]) # Use token or params for API
#     if current_user
#       current_user
#     else
#       render json: { error: 'Not Authorized' }, status: :unauthorized
#     end
#   end

#   # Allow users to obtain OAuth tokens with email & password
#   resource_owner_from_credentials do |routes|
#     user = User.find_by(email: request.params[:email])
#     if user&.authenticate(request.params[:password])
#       user
#     else
#       nil
#     end
#   end
# end

Doorkeeper.configure do
  orm :active_record

  # OAuth grant types
  grant_flows %w[password client_credentials]

  # Authenticate user before issuing tokens (only used in web-based apps)
  resource_owner_authenticator do
    User.find_by(id: doorkeeper_token&.resource_owner_id) || render(json: { error: 'Not Authorized' }, status: :unauthorized)
  end

  # Allow users to obtain OAuth tokens with email & password
  resource_owner_from_credentials do |routes|
    user = User.find_by(email: request.params[:email])
    if user&.authenticate(request.params[:password])
      user
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  # Token expiration (2 hours)
  access_token_expires_in 2.hours

  # Enable refresh tokens
  use_refresh_token
end

