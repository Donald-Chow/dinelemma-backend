class CurrentUserController < ApplicationController
  skip_after_action :verify_policy_scoped

  def index
    if user_signed_in?
      render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
    else
      render json: { message: "User not logged in" }, status: :ok
    end
  end
end
