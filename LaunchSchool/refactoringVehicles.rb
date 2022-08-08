class Vehicle

  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make}, #{model}"
  end

end


class Car < Vehicle

  def wheels
    4
  end

end

class Motorcycle < Vehicle

  def wheels
    2
  end

end

class Truck < Vehicle

  attr_reader :payload

  def initialize(make, name, payload=0)
    super(make, name)
    @payload = payload
  end

  def to_s
    "#{super}, #{payload}KG."
  end

  def wheels
    6
  end

end

car1 = Car.new("Mercedez Benz", 2020)
moto1 = Motorcycle.new("YAMAHA", 2017)
truck1 = Truck.new("Renault", 2021, 50)

puts car1
puts moto1
puts truck1