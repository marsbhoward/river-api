class Movie < ApplicationRecord
	belongs_to :stream
	
	validates_uniqueness_of :slug, scope: :stream_id
	validates :year, uniqueness: { scope: :slug }	 
end
