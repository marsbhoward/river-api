class Movie < ApplicationRecord
	belongs_to :stream
	validates :year, uniqueness: { scope: :title }
end
