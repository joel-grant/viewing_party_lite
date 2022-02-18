class UsersController < ApplicationController
  def new
  end

  def discover
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)

    if @user.save
      flash[:alert] = "User Created Successfully!"
      redirect_to "/users/#{@user.id}"
    elsif @user.name.empty?
      flash[:alert] = "Name can not be blank!"
      redirect_to "/register"
    elsif @user.email.empty?
      flash[:alert] = "Email can not be blank!"
      redirect_to "/register"
    elsif @user.email.empty? && @user.name.empty?
      flash[:alert] = "Name and Email can not be blank!"
      redirect_to "/register"
    elsif params[:password].empty? || params[:password_confirmation].empty?
      flash[:alert] = "Password and/or Password Confirmation can not be blank!"
      redirect_to "/register"
    elsif @user.errors.messages[:password_confirmation][0] == "doesn't match Password"
      flash[:alert] = "The passwords must match!"
      redirect_to "/register"
    end
  end

  def login_form

  end

  # def login_user
    # @user = User.find_by(email: params[:email])
    # if @user != nil && @user.authenticate(params[:password])
    #   redirect_to "/users/#{@user.id}"
    # else
    #   flash[:alert] = "Incorrect Login Information"
    #   redirect_to "/login"
    # end
  # end

private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
