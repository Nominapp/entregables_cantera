class Cat
    attr_reader :name
  
    def initialize(name)
      @name = name
      puts "I'm #{name}"
    end
  end
  
  kitty = Cat.new('Sophie')
  kitty