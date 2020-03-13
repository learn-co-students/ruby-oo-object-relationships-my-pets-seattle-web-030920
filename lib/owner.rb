require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"    
    @@all << self    
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}    
  end
  
  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name) 
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    self.set_mood(self.dogs,"happy")    
  end

  def feed_cats
    self.set_mood(self.cats,"happy")    
  end

  def set_mood(array,mood)
    array.each{|animal| animal.mood = mood}    
  end

  def sell_pets
      [self.dogs,self.cats].each{|animalSet| self.set_mood(animalSet,"nervous"); animalSet.each{|animal| animal.owner = nil} }
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    Owner.all.length
  end

  def self.reset_all
    self.all.clear
  end
end