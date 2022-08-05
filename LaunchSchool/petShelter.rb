class Pet

	attr_reader :animal, :name

	def initialize(animal, name)
		@animal = animal
		@name = name
	end

end

class Owner
	attr_reader :name
	attr_accessor :number_of_pets, :adopted_pets

	@@owners = []

	def initialize(name)
		@name = name
		@number_of_pets = 0
		@adopted_pets = {}
		@@owners.push(self)
	end

	def print_adoptions
		@@owners.each do |owner|
			puts "#{owner.name} has adopted the following pets:"
			owner.adopted_pets.each do |key, value|
				puts "a #{value} named #{key}"
			end
			puts  
		end
	end
end

class Shelter < Owner

	def initialize

	end

	def adopt(owner, pet)
		owner.number_of_pets += 1
		owner.adopted_pets[pet.name] = pet.animal
	end

	
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."