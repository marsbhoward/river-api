class MoviesController < ApplicationController

	def index
		movies = Scraper.new.get_movies(Stream.find(params[:stream_id]))
  		render json: movies
	end

  def show
    movie = Movie.find_by(id: movies_params[:id], stream_id: stream_params[:stream_id])
    render json: movie
  end

  def update
    movie = Movie.find_by(id: movies_params[:id], stream_id: stream_params[:stream_id])
    movie.update(:youtube_id => movies_params[:youtube_id])
      render json: movie
  end	

  	def movies_params
    	params.permit(:id,:title,:year,:youtube_id)
  	end

   	def stream_params
    	params.permit(:stream_id,:name,:url)
  	end  
end
