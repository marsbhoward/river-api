class User < ApplicationRecord
	has_many :user_streams
	after_initialize :init
	
	def init
		self.darkmode ||= false
	end
end
