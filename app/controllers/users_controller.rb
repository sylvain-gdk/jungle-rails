class UsersController < ApplicationController
  def new
    session[:referral_url] = request.referer
    @users = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to session[:referral_url], notice: 'Account created!' and return
    else
      redirect_to :back, notice: 'Errrorrrr' and return
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
