class MoviesController < ApplicationController

	def index
		movies = Scraper.new.get_movies(Stream.find(params[:stream_id]))
  		render json: movies
	end

  def update
    movie = Movie.find(params[:movie_id]))
    movie.update(:youtube_id => movies_params[:youtube_id])
    render json: movie
  end	

  	def movies_params
    	params.permit(:movie_id,:title,:year,:youtube_id)
  	end

   	def stream_params
    	params.permit(:stream_imd,:name,:url)
  	end  
end
