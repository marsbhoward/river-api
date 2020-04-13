class UserStreamsController < ApplicationController
  def index
  	user_streams = UserStream.all
  	render json: user_streams
  end

  def create
  	user_stream = UserStream.find_or_create_by(user_id: userstream_params[:user_id],stream_id: userstream_params[:stream_id])
  	render json: user_stream
  end

  def destroy
  	user_stream = UserStream.find(user_id: userstream_params[:user_id],stream_id: userstream_params[:stream_id])
  	user_stream.destroy
  	render :json: user_stream
  end

  def userstream_params
    params.permit(:user_id,:stream_id)
  end  

end
