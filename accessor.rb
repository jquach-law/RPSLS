# initialize and attr_accessor have nothing to do with each other #

# Accessor (setter / getter)
class Person
  def name
    @name
  end

  def name=(str)
    @name = str
  end
end

class Person
  attr_accessor :name
end

# NO RELATION

# Initializer
# If you want to set name upon object creation, you can do it in the initializer:
def initialize(name)
  @name = name
end