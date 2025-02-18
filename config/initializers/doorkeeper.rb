
Doorkeeper.configure do
  orm :active_record

  resource_owner_from_credentials do |routes|
    user = User.find_for_authentication(email: params[:username])
    if user&.valid_password?(params[:password])
      user
    end
  end

  # ✅ Define default and optional scopes
  default_scopes :public
  optional_scopes :read, :write
end
