class Character
  attr_reader :actor,
              :salary

  attr_accessor :name

  def initialize(info_hash)
    @name   = info_hash[:name]
    @actor  = info_hash[:actor]
    @salary = info_hash[:salary]
  end
end
