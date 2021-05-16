require 'nokogiri'
require 'open-uri'

class Scraper < ApplicationRecord
	def get_movies(stream)
		current_stream = Stream.find_by(name:stream.name)
		movie_collection = []

			movies =  Nokogiri::HTML(open(current_stream.url)).css('a')
    		id = 0
    		year = "0"


    		if Time.now.strftime("%d") == "01" && Time.now.strftime("%k").to_i < 8
    		#deletes all movies (needs to be done on first of each month)
				Movie.delete_all 

     		#iterates through all of the img tags and selects those that contain class value
			 movies.to_a.each { |element| 
			 if (element.to_s.include? '"css-1rashen e126mwsw1"')
				 element = element.to_a
				 element = element[0]
				 element = element[1]
				 element = element.to_s.sub("/movie/","")
				 year = (element.split(//).last(4).join).to_s
				 if year =~ /\d/
					 element = element[0...-5] 
				 else
					 year = 2021
				 end
				 if movie_collection.include?([element,year])
				 else 
					 if element.include?("soul") && current_stream.id === 5
						 element = "soul"
						 year = 2000
					   end					
					 movie_collection.push([id,element,year])
					 id = id + 1
				 end
			 end
			 }
 
 
			 movie_collection.each do | movie|
				 movie_title = movie[1];
				 movie_year = movie[2];
				 if Movie.exists?(slug: movie_title, year: movie_year)
					 puts "movie already present"
					 next
				 else
					 puts "movie created"
					 current_stream.movies.create(slug: movie_title, year: movie_year);
				 end
			 end				
			end

		current_stream.movies.order(:id)
		return current_stream.movies
	end
end