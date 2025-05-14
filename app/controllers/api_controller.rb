# app/controllers/api_controller.rb
class ApiController < ActionController::API
  include ActionController::
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
