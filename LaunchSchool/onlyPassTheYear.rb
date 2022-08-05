class Vehicle
  attr_reader :year

  def initialize(year, bed_type)
    @year = year
    @bed_type = bed_type
  end
end

class Truck < Vehicle
  
  attr_reader :bed_type
end

class Car < Vehicle
    def initialize(year)
    @year = year
  end
end

truck1 = Truck.new(1994, 'Short')
car1 = Car.new(1984)
puts truck1.year
puts truck1.bed_type
