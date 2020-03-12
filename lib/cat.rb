class Cat
  # code goes here
  attr_reader :name 
  attr_accessor :owner, :mood
  @@all=[]
  def initialize(name, owner)
    @name=name
    @species= "cat"
    @owner=owner
    @@all << self
    @mood="nervous"
  end
def self.all
  @@all
end

end