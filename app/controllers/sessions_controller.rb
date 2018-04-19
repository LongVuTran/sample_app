class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      check_login_true
    else
      check_login_false
    end
  end

  def check_login_true
    user = User.find_by(email: params[:session][:email].downcase)
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    redirect_to user
  end

  def check_login_false
    flash[:danger] = I18n.t(".danger_flash")
    render :new
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end
end
