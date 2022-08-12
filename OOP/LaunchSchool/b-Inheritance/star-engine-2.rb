class Vehicle
    def start_engine
      'Ready to go! Drive fast, please!'
    end
  end
  
  class Truck < Vehicle
    def start_engine(speed)
    end
  end
  
  truck1 = Truck.new
  puts truck1.start_engine('fast')