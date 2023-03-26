class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_session_path
    else
      render :new
    end
  end

  def sign_in
    @user = User.new
    if user_signed_in?
      redirect_to user_session_path(:id)
    # else
    #   render :sign_in
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password_digest, :password_confirmation)
  end
end
