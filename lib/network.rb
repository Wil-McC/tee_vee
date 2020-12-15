class Network
  attr_reader :name,
              :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows.push(show)
  end

  def main_characters
    @shows.map do |show|
      show.characters.select do |char|
        char.salary > 500_000 && char.name.upcase == char.name
      end
    end.flatten
  end

  def actors_by_show
    show_actors_hash = Hash.new
    @shows.each do |show|
      show_actors_hash[show] = show.actors
    end
    show_actors_hash
  end
end
