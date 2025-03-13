class ApplicationController < ActionController::API
    include Doorkeeper::Helpers::Filter  # 👈 Add this to ensure doorkeeper is loaded
  end
  