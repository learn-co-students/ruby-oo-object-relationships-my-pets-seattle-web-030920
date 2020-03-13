class Owner

  attr_reader :name, :species

  @@all = []

  def initialize (name)
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
    Cat.all.select {|animal| animal.owner == self}
  end

  def dogs
    Dog.all.select {|animal| animal.owner == self}
  end

  def buy_cat (new_cat)
    Cat.new(new_cat, self)
  end

  def buy_dog (new_dog)
    Dog.new(new_dog, self)
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def sell_pets
    cats.each {|animal| (animal.mood = "nervous") &&  (animal.owner = nil)}
    dogs.each {|animal| (animal.mood = "nervous") &&  (animal.owner = nil)}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end