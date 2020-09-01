require 'nokogiri'
require 'open-uri'

class Scraper < ApplicationRecord
	def get_movies(stream)
		current_stream = Stream.find_by(name:stream.name)
		movie_collection = {}

			movies =  Nokogiri::HTML(open(current_stream.url)).css('a')

    		index = 0
    		id = 1
    		year = "0"

    		#deletes all movies (needs to be done on first of each month)
    		#Movie.delete_all

     		#iterates through all of the img tags and selects those that contain class value
	   movies.to_a.each { |element| 
	          if (element.to_s.include? '"css-1rashen e126mwsw1"')
	              element = element.to_a
	              if index > 14 and index < 40
	                element = element[0][1]
	                element = element.to_s.sub("/movie/","")
	                year = (element.split(//).last(4).join).to_s
	                element = element[0...-5] 
	                if movie_collection.include?([element,year])
	                else 
	                	movie_collection[index] = [id,element,year]
	                end
	              elsif (index >40)
	              else
	                element = element[0]
	                element = element[1]
	                element = element.to_s.sub("/movie/","")
	                year = (element.split(//).last(4).join).to_s
	                element = element[0...-5] 
	                if movie_collection.include?([element,year])
	                else 
	                	movie_collection[index] = [id,element,year]
	                end
	              end
	          index = index + 1
	          id = id + 1
	          end
	          }


      			movie_collection.each_with_index do | movie|
      					xindex = 1
      					movie_title = movie[xindex][1];
      					movie_year = movie[xindex][2];
      					if current_stream.movies.exists?(slug: movie_title, year: movie_year)
      					else
      					current_stream.movies.create(slug: movie_title, year: movie_year);
      					end
      					xindex = xindex + 1;
      				
      			end

      		current_stream.movies.order(:id)
			return current_stream.movies
	end
end