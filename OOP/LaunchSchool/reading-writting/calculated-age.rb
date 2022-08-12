class Person
    attr_accessor :age
    
    def initialize
        age = age*2
    end

    def age 
        @age = @age*2
    end 

end

person1 = Person.new
person1.age = 20
puts person1.age