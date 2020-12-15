class Show
  attr_reader :name,
              :creator,
              :characters

  def initialize(name, creator, character_array)
    @name            = name
    @creator         = creator
    @characters      = character_array
  end

  def total_salary
    salary_sum = 0
    @characters.each do |char|
      salary_sum += char.salary
    end
    salary_sum
  end

  def highest_paid_actor
    highest_paid = @characters.max_by do |char|
      char.salary
    end.actor
  end

  def actors
    @characters.map do |char|
      char.actor
    end
  end
end
