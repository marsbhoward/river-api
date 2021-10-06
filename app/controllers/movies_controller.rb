class MoviesController < ApplicationController
	def index

    if Scraper.first.last_update != Time.now.strftime("%m").to_s
      Movie.delete_all 
      Scraper.first.get_month
     
      Stream.all.sort().each do |stream|
        Scraper.first.get_movies(Stream.find(stream.id))
      end  
    else
      puts "Im updated"
    end
    
    if params[:stream_id] != nil 
      movies = Movie.where(stream_id: params[:stream_id]).sort()
    else
      movies = Movie.all.sort()
    end
      render json: movies
	end

  def show
    movie = Movie.find_by(id: movies_params[:id], stream_id: stream_params[:stream_id])
    render json: movie
  end

  def update
    movie = Movie.find_by(id: movies_params[:id], stream_id: stream_params[:stream_id])
    
    if movies_params[:youtube_id] != nil 
      movie.update(:youtube_id => movies_params[:youtube_id])
    end

    if movies_params[:title] != nil || movies_params[:poster] != nil
      movie.update(:title => movies_params[:title], :poster => movies_params[:poster])
    end

    if movies_params[:year] != nil
      movie.update(:year => movies_params[:year])
    end
    if movies_params[:slug] != nil
      movie.update(:slug => movies_params[:slug])
    end    
      render json: movie
  end	

  	def movies_params
    	params.permit(:id,:slug,:year,:youtube_id,:title,:poster)
  	end

   	def stream_params
    	params.permit(:stream_id,:name,:url)
  	end  
end
