class SessionsController < ApplicationController
  def new
    session[:referral_url] = request.referer
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to session[:referral_url] and return
    else
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to session[:referral_url] and return
  end

end
