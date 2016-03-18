class Subject < ActiveRecord::Base
	def username
		@username
	end
	def username=(value)
		@username=value
	end
	def password
		@password
	end
	def password=(value)
		@password=value
	end
end
