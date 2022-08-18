class Pet 

    attr_reader :pet
    attr_reader :name

    def initialize (pet, name)
        @pet = pet 
        @name = name
    end 

end 

class Owner 
    attr_reader :name

    def initialize(name)
        @name = name
        @adopt = []
    end 

    def adopt(pet)
        adopt << pet
    end 

    def print_pets
        adopt.each { |pet| puts pet }
    end
end 

# class Shelter
#     attr_reader :name_owner
#     attr_reader :pet
#     def adopt(name = Owner.new(name), pet = Pet.new(specie, pet))
#         @name_owner = phanson.name
#         @pet = pet
#     end

#     # def print_adoptions
#     #     P Hanson has adopted the following pets:
#     #     a cat named Butterscotch
#     #     a cat named Pudding
#     #     a bearded dragon named Darwin
#     # end 

# end





butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

phanson.print_pets
bholmes.print_pets

# shelter = Shelter.new
# puts shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions