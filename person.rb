require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rental

  def initialize(age, name = 'Unknown', parent_permission = true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
    @id = Random.rand(1..1000)
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    @parent_permission || of_age?
  end
end
