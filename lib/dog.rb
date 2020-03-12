class Dog
  # code goes here
  attr_reader :name 
  attr_accessor :owner, :mood
  @@all=[]
  def initialize(name, owner)
    @name=name
    @species= "dog"
    @owner=owner
    @@all << self
    @mood="nervous"
  end
def self.all
  @@all
end
end