class Cat
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end

    def identify 
     puts self
    end    
  end
  
  kitty = Cat.new('Sophie')
  puts kitty.identify
