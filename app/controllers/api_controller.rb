# app/controllers/api_controller.rb
class ApiController < ActionController::API
  include ActionController::Cookies

  def current_user
    Rails.logger.info("current_user called. session[:user_id] = #{session[:user_id]}")
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
