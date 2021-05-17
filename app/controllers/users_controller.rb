class UsersController < ApplicationController
  def index
  	users = User.all
  	render json: users
  end

  def create()
    user = User.find_or_create_by(username: user_params[:username],email: user_params[:email])
    render json: user
  end 

  def show
    user = User.find_by(id: user_params[:id])
    render json: user
  end

  def update
    user = User.find_by(id: user_params[:id])
    user.update(:darkmode => user_params[:darkmode])
    render json: user
  end
  private
  	def user_params
    	params.permit(:id, :username, :email, :darkmode)
  	end   	
end
