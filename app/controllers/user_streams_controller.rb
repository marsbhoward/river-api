class UserStreamsController < ApplicationController
  def index
  	user_streams = UserStream.all
  	render json: user_streams
  end

  def create
    user = User.find_by(email: userstream_params[:user_email])
    stream = Stream.find_by(name: userstream_params[:stream_name])
  	user_stream = UserStream.find_or_create_by(user_id: user.id, stream_id: stream.id)
  	render json: user_stream
  end

  def destroy
  	user_stream = UserStream.find(user_id: userstream_params[:user_id],stream_id: userstream_params[:stream_id])
  	user_stream.destroy
  	render body: nil, status: :no_content
  end

  def userstream_params
    params.permit(:user_email,:stream_name)
  end  

end
