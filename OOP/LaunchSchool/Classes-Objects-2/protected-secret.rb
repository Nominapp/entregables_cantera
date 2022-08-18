class Person
    attr_writer :secret

    protected 

    attr_reader :secret

    def compare_secret(person)
        puts secret == person.secret ? true : false 
    end
  end
  
  person1 = Person.new
  person1.secret = 'Shh.. this is a secret!'

  person2 = Person.new
  person2.secret = 'Shh.. this is a different secret!'
  
  person1.compare_secret(person2)