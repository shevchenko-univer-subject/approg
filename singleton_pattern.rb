#!/ruby 

class Settings
	class << self
		alias new_singleton new
		private :new
		@@instance = nil

		def new(*args)
			@@instance ||= new_singleton(*args)
		end
	end

	def initialize(params)
		@x = params[:x]
		@r = params[:r]
	end
end

p Settings.new({x: 3, r: 2})
p Settings.new({x: 3, r: 4})

