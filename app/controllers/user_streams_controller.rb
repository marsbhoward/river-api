class UserStreamsController < ApplicationController
  def index
  	user_streams = UserStream.where(user_id: user_stream_params[:user_id])
  	render json: user_streams
  end

  def create
  	user_stream = UserStream.find_or_create_by(user_id: user_stream_params[:user_id], stream_id: user_stream_params[:stream_id], selected: true)
  	render json: user_stream
  end

  def show
    user_stream = UserStream.where(user_id: user_stream_params[:user_id],id: user_stream_params[:id])
    render json: user_stream
  end

  def update
    user_stream = UserStream.find_or_create_by(user_id: user_stream_params[:user_id], stream_id: user_stream_params[:stream_id], selected: user_stream_params[:selected])
     if user_stream.update_attributes(user_stream_params)
      render :json => {}, :status => :ok
    else
      render :json => {}, :status => :bad_request
    end
  end

  def destroy
  	user_stream = UserStream.find_by(user_id: user_stream_params[:user_id],stream_id: user_stream_params[:stream_id])
  	user_stream.destroy
  	render body: nil, status: :no_content
  end

  def user_stream_params
    params.permit(:user_id,:stream_id,:id,:selected)
  end  
end
