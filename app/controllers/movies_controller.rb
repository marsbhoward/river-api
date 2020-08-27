class MoviesController < ApplicationController

  #change to create
	def index
    if params[:stream_id] != nil 
		  movies = Scraper.new.get_movies(Stream.find(params[:stream_id]))
    else
      movies = Movie.all
    end
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
    	params.permit(:id,:year,:youtube_id)
  	end

   	def stream_params
    	params.permit(:stream_id,:name,:url)
  	end  
end
