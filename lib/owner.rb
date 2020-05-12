class Owner
  
  @@all = []
  def initialize(name) 
    @name = name 
    @species = 'human'
    @@all << self
  end
  
  def name 
    @name 
  end 
  
  def species 
    @species 
  end 
  
  def say_species 
    "I am a #{@species}."
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.count
    @@all.length
  end 
  
  def self.reset_all
    @@all = []
  end 
  
  def cats 
    Cat.all.find_all {|cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.find_all {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    new_cat = Cat.all.find {|cat| cat.name == name}
    new_cat.owner=(self)
  end
  
  def buy_dog(name)
    new_dog = Dog.all.find {|dog| dog.name == name}
    new_dog.owner=(self)
  end
  
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy" }
  end
  
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy" }
  end
  
  def sell_pets 
    self.cats.each {|cat| cat.mood=("nervous")}
    self.dogs.each {|dog| dog.mood=("nervous")}
    self.cats.each {|cat| cat.owner=(nil)}
    self.dogs.each {|dog| dog.owner=(nil)}
  end 
  
  def list_pets 
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end 
  
end