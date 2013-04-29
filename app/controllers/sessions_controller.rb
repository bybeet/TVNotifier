class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.user_id
  		redirect_to users_path
  	else
  		redirect_to login_url, alert: "Invalid username/password combination"
  	end
  end

  def destroy
  end
end
