class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user != nil && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/dashboard"
    else
      flash[:alert] = "Incorrect Login Information"
      redirect_to "/login"
    end
  end
end
