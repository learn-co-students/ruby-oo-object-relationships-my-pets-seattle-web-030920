require 'pry'
 require_relative 'console.rb'
class Owner
  attr_accessor 
  attr_reader :name, :species 
  attr_writer

  @@all = []

  def initialize(name)
    @name = name 
    @species = "human" 

    @@all << self 
  end

  def self.all 
    @@all
  end

  def say_species
    "I am a human." 
  end
  
  def self.reset_all
    @@all = [] 
  end

  def self.count 
    @@all.count()
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end 

  def dogs 
    Dog.all.select{|dog| dog.owner == self}
  end 

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self) 
  end

  def walk_dogs
    dogs.map{|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.map{|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats 
    pets.map{|pet| 
    pet.mood = "nervous" 
    pet.owner = nil
  }
    
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end

