require 'nokogiri'
require 'open-uri'

class Scraper < ApplicationRecord
	include ScraperUtilities
	  

	def get_movies(stream)
		current_stream = Stream.find_by(name:stream.name)

		if current_stream.movies.count === 0
			movies =  Nokogiri::HTML(open(current_stream.url))
			#movie_collection = []
			#id = 0
			#year = "0"
		
			#new process for tageting movies based on websites new flow.
			scripts = movies.css("body script")
    		target = scripts[3].text
			script_array = target.split('@global')
			#scapes all info on first movie puts movies
			
		
			script_array.each do |segment|
				next unless segment.include?('"title"') && segment[1]== "t"
				#splits movie info into array
				movie_array = segment.split ('","')
				#splits array text into attributes and assigns them
				title = movie_array[0].split(":")[1]
				released_on = movie_array[1].split(':"')[1]
				year = released_on.split('-')[0][0..3]
				slug = movie_array[2].split('slug":"')[1]

				
				# checks if movie with the current slug and year already exsits
				# if movie exsists go to next entry without creating new movie
				if Movie.exists?(slug: slug, year: year)
					puts "movie already present"
				else
					puts "movie created"
					current_stream.movies.create(slug: slug, title: title, year: year);
				end
				x += 1
			end
		end

		current_stream.movies.order(:id)
		return current_stream.movies
	end
end