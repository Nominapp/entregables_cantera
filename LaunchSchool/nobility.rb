module Walkable
	def walk
		puts "#{title if title} #{name} #{gait} forward"
	end
end

class Noble
	attr_reader :name, :title

	include Walkable

	def initialize(name, title)
		@name = name
		@title = title
	end

	def gait
		"struts"
	end
end

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"

byron.name
# => "Byron"
byron.title
# => "Lord"