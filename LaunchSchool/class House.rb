class House
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def to_s
    "#{price}".to_i
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)

puts "Home 1 is cheaper" if home1.to_s < home2.to_s
puts "Home 2 is more expensive" if home2.to_s > home1.to_s