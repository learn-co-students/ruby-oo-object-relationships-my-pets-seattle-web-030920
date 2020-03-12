require 'pry'
class Owner
    attr_reader :name, :species
    @@all = []
    def initialize(name)
      @name = name 
      @species = "human"
      @@all << self
    end

    def say_species
      "I am a human."
    end

    def self.all
      @@all
    end

    def self.count
      @@all.count 
    end

    def self.reset_all
      @@all = []
    end

    def cats 
      cats = Cat.all.select {|i| i.owner == self}
    end

    def dogs
      dogs = Dog.all.select {|i| i.owner == self}
    end

    def buy_cat(name)
      Cat.new(name, self)
    end

    def buy_dog(name)
      Dog.new(name, self)
    end

    def walk_dogs
      self.dogs.each {|i| i.mood = "happy"}
    end

    def feed_cats
      self.cats.each {|i| i.mood = "happy"}
    end

    def sell_pets
      (cats + dogs).each {|animal| animal.owner = nil; animal.mood = "nervous"}
    end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end

end