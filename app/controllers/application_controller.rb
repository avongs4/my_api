class ApplicationController < ActionController::API
    before_action :doorkeeper_authorize!  # ✅ This is the correct way to apply Doorkeeper
  end
  