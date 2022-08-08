module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  attr_reader :name, :address, :city, :state, :zipcode
  def initialize(name, address, city, state, zipcode)
    @name = name
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
  end
  include Mailable
end

class Employee
  attr_reader :name, :address, :city, :state, :zipcode
  def initialize(name, address, city, state, zipcode)
    @name = name
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
  end
  include Mailable
end

betty = Customer.new('Luisa', 'Carrera 79A # 20A - 135', 'Medellín', 'Antioquia', '050033')
bob = Employee.new('Cristian', 'Carrera 110 # 38 - 11', 'Medellín', 'Antioquia', '050033')
betty.print_address
bob.print_address