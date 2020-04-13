class UserStreamsController < ApplicationController
  def index
  	user_streams = UserStream.all
  	render json: user_streams
  end

  def userstream_params
    params.permit(:user_id,:stream_id)
  end  

end
