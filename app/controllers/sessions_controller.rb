class SessionsController < ApplicationController
  skip_before_action :authorize
    
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password]) and user.admin
      session[:user_id] = user.id
      redirect_to admin_url
    elsif user and user.authenticate(params[:password])
      redirect_to login_url, alert: "Programmers can't log in!"
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_url, notice: "Logged out" #need to update it to the actuall link to creating the ticket
  end
end
