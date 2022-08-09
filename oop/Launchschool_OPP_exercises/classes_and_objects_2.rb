# 1.
class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

# 2.
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    @name = new_name
  end
end

kitty = Cat.new('Sophie')
puts kitty.name
kitty.rename('Chloe')
puts kitty.name

# 3.
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self.inspect
  end
end

kitty = Cat.new('Sophie')
p kitty.identify

# 4.
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{name}"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting

# 5.
class Cat
  @@total = 0

  def initialize
    @@total += 1
  end

  def self.total
    @@total
  end

end

kitty1 = Cat.new
kitty2 = Cat.new

puts Cat.total

# 6.
class Cat
  COLOR = "purple"

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name} and I'm a #{COLOR} cat"
  end
end
kitty = Cat.new('Sophie')
kitty.greet

# 7.
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{@name}"
  end
end

kitty = Cat.new('Sophie')
puts kitty

# 8.
class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

# 9.
class Person
  attr_writer :secret

  def share_secret
    puts "#{@secret}"
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

# 10.
class Person
  attr_writer :secret

  def compare_secret(secret)
    @secret == secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)
