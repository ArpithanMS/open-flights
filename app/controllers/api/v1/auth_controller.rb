module Api
  module V1
    class AuthController < ApiController
      include Resettable
      before_action :authenticate, only: [:logout]

      def create
        user = User.new(user_params)

        if user.save
          session[:user_id] = user.id
          render json: { status: :success, logged_in: true }, status: :created
        else
          render json: { status: :error, logged_in: false, errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def logout
        reset_session
        render json: { logged_in: false }, status: :ok
      end

      def logged_in
        if current_user
          render json: { email: current_user.email, logged_in: true }, status: :ok
        else
          render json: { logged_in: false }, status: :ok
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
