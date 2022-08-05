class Cat

	COLOR = "purple"

	def initialize(name)
		@name = name
	end

	def greet
		puts "Hello! My name is #{@name} and I'm a #{Cat::COLOR} cat!"
	end

end


kitty = Cat.new('Sophie')
kitty.greet
kitty2 = Cat.new('Doc')
kitty2.greet