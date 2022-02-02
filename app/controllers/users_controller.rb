class UsersController < ApplicationController
  def new
  end

  def show
    facade = MovieFacade.new
    require "pry"; binding.pry
    @user = User.find(params[:id])
  end

  def create
    @user = User.create!(name: params[:name], email: params[:email])
    redirect_to "/users/#{@user.id}"
  end

end
