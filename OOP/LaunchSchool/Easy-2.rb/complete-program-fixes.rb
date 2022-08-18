class House
    attr_reader :price
  
    def initialize(price)
      @price = price
    end

    def compare(hause)
      puts price < hause.price ?  "Home 1 is cheaper" :  "Home 2 is more expensive"
    end
end
  
  home1 = House.new(200_000)
  home2 = House.new(150_000)
  home1.compare(home2)