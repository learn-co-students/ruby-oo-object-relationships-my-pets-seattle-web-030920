
class Association
    attr_accessor :pet, :owner

    @@all = []

    def initialize(pet, owner)
        @pet = pet 
        @owner = owner 
        pet.owner = owner 

        @@all << self 
    end 

    def self.all 
        @@all 
    end

    def self.buy_cat(name)
        Cat.new(name, owner)
    end 
    
    def self.buy_dog(name)
        Dog.new(name, owner)
    end 

end