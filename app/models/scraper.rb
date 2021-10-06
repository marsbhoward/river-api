require 'nokogiri'
require 'open-uri'

class Scraper < ApplicationRecord
	include ScraperUtilities
	  

	def get_movies(stream)
		current_stream = Stream.find_by(name:stream.name)
		movies =  Nokogiri::HTML(open(current_stream.url))
		#movie_collection = []
    	#id = 0
    	#year = "0"
	
		movies = movies.at('script:contains("entities")').text.strip
		movies= movies.split('entries')
		movies = movies[1].split('@global":')
		movies = movies.drop(1)
		#scapes all info on first movie puts movies
		
		if current_stream.movies.count === 0
			x = 0
			while x < 50 && x < movies.length do
			view = movies[x].split(',')
			title = view[0].split(":")[1]
			slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
			year = view[1].chomp('"')
		
				if year.include? ':'
					year = year.split(':')[1]
					year = year[1..4]
				else
				
				end
				
				#skips movie if release year is not valid
				if year.match(/[[:alpha:]]+$/)
					x+=1
					next
				end
				
				# checks if movie with the current slug and year already exsits
				# if movie exsists go to next entry without creating new movie
				if Movie.exists?(slug: slug, year: year)
					puts "movie already present"
					x += 1
					next
				else
					puts "movie created"
					current_stream.movies.create(slug: slug, year: year);
				end
				x += 1
			end
		end

		current_stream.movies.order(:id)
		return current_stream.movies
	end
end