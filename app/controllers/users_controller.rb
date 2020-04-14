class UsersController < ApplicationController
  def index
  	users = User.all
  	render json: users
  end

  def create()
    user = User.find_or_create_by(username: user_params[:username],email: user_params[:email])
    Stream.all.each do |stream|
      user_stream = UserStream.find_or_create_by(user_id: user_params[:id],stream_id: stream.id, selected: true)
    end
    render json: player
  end 
  
  private
  	def user_params
    	params.require(:user).permit(:id, :username, :email)
  	end   	
end
