class UserStreamsController < ApplicationController
  def index
  	user_streams = UserStream.all
  	render json: user_streams
  end

  def create
  	user_stream = UserStream.find_or_create_by(user_id: user_stream_params[:user.id], stream_id: user_stream_params[:stream_id], selected: true)
  	render json: user_stream
  end

  def destroy
  	user_stream = UserStream.find(user_id: user_stream_params[:user_id],stream_id: user_stream_params[:stream_id])
  	user_stream.destroy
  	render body: nil, status: :no_content
  end

  def user_stream_params
    params.require(:user_stream).permit(:user_id,:stream_id)
  end  
end
