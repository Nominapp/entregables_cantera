### Pregunta 1
class Dog
    def initialize(name)
      @name = name
    end
  end
### Pregunta 2
class Dog
    def initialize(name)
      @name = name
    end
  end

Variable = Dog.new("Firulais")

### Pregunta 3
class Dog
    def initialize(name)
      @name = name
    end
    def bark()
        return "Ruff ruff"
    end

end
Variable = Dog.new("Firulais")

### Pregunta 4

class Dog
    def initialize(name)
      @name = name
    end
    def bark()
        return "Ruff ruff"
    end

end
Variable = Dog.new("Firulais")
variable.bark()

### Pregunta 5
#Sale un error, debido a que el metodo speak no esta creado

### Pregunta 6
class Insect
    def initialize(age_in_days)
      @age_in_days = age_in_days
    end
  
    def age_in_years()
      @age_in_days.to_f 
      @age_in_days /= 365
      return @age_in_days
    end
  end

### Pregunta 7
# Error por que aun no se ha instanciado la clase Dog

### Pregunta 8
class Lamp
    def self.about_me()
      return("We brighten up people's lives")
    end
  end


### Pregunta 9
class Person
    def initialize(age)
      @age = age
    end
  
    def age=(nage)
      @age = nage
    end
  
    def age()
      return(@age)
    end
  end
  
prueba = Person.new(10)
prueba.age 
prueba.age=(12)  
prueba.age  




### Pregunta 11
module HappyHappy
    def say_something()
      return("Happy happy, joy joy")
    end
  end
  
  class Person
    include HappyHappy
  end
  
  class Alien
    include HappyHappy
  end

uno  = Person.new()
uno.say_something() # returns "Happy happy, joy joy"
dos = Alien.new()
dos.say_something()

### Pregunta 12
module MathHelper
    def multiply_by_two(number)
        number = number *2
      return(number)
    end
  end
  
  class Homework
    include MathHelper
  end
  
  mi_tarea = Homework.new
  mi_tarea.multiply_by_two(4)

### Pregunta 13
prueba = Dog.new()
prueba.heartbeat?

### Pregunta 14
Array.ancestors()

### Pregunta 16
class BaseballPlayer
    def initialize(hits, walks, at_bats)
      @hits = hits
      @walks = walks
      @at_bats = at_bats
    end
  
    def batting_average()
      return(@hits.to_f / @at_bats)
    end
  
    def on_base_percentage()
      return((@hits + @walks).to_f / @at_bats)
    end
  end
  
  
  barry_bonds = BaseballPlayer.new(330, 110, 1125)
  barry_bonds.batting_average()
  barry_bonds.on_base_percentage()

### Pregunta 17
class Person
    def initialize(name_one, name_two)
      @name_one = name_one
      @name_two = name_two
    end
  
    def first_name()
      return(@name_one)
    end
  
    def last_name()
      return(@name_two)
    end
  
    def full_name()
      return("#{name_one} #{name_two}")
    end
  end
  
  name = Person.new("Carlos", "Mario")
  name.full_name()

### Pregunta 18
module MathHelpers
    def exponent(number, exponent)
        number = numer  ** exponent
      return(number)
    end
  end
  
  class Calculator
    include MathHelpers
  
    def square_root(number)
        number = exponent(number, 0.5)
      return(number)
    end
  end
  
  prueba = Calculator.new
  prueba.square_root(4)
  prueba.square_root(5)