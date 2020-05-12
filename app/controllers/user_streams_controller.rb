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
    user_stream = UserStream.find_by(user_stream_params)

    if user_stream.update(user_stream_params)
      render json: UserStream.new(user_stream).serialized_json
    else
      render body: nil, status: :no_content
    end
  end

  def destroy
  	user_stream = UserStream.find_by(user_id: user_stream_params[:user_id],stream_id: user_stream_params[:stream_id])
  	user_stream.destroy
  	render body: nil, status: :no_content
  end

  def user_stream_params
    params.require(:user_stream).permit(:user_id,:stream_id,:id,:selected)
  end  
end


  #def update
  #  user_stream = UserStream.find_or_create_by(user_id: user_stream_params[:user_id], stream_id: user_stream_params[:stream_id], selected: user_stream_params[:selected]).update(:selected => user_stream_params[:selected])
  #  render json: user_stream
  #end