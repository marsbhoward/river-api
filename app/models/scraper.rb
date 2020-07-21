require 'nokogiri'
require 'open-uri'

class Scraper < ApplicationRecord
	def get_movies(stream)
		current_stream = Stream.find_by(name:stream.name)
		movie_collection = []
		movie_data = []

			movies =  Nokogiri::HTML(open(current_stream.url)).css('a')

			list = []
    		index = 0
    		year = "0"
     		movies =Nokogiri::HTML(open(current_stream.url)).css('a')


     		#iterates through all of the img tags and selects those that contain class value
     		movies.to_a.each { |element| 
	     		if (element.to_s.include? '"css-1rashen e126mwsw1"')
	      			element = element.to_a
	      			if index > 14 and index < 40
		        		element = element[0][1]
		        		element = element.to_s.sub("/movie/","")
		        		year = (element.split(//).last(4).join).to_s 
		        		current_stream.movies.new(title: element[0...-5], year: year)
		        		movie_collection.push(title: element[0...-5], year: year) 
	      			elsif (index >40)
	        		else
		         		element = element[0]
		         		element = element[1]
		         		element = element.to_s.sub("/movie/","")
		         		year = (element.split(//).last(4).join).to_s 
		         		current_stream.movies.new(title: element[0...-5], year: year)
		         		movie_collection.push(title: element[0...-5], year: year) 
	      			end
					index = index + 1
    			end
      		}
			return movie_collection
	end
end