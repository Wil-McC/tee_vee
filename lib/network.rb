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

  def shows_by_actor
    actors = (@shows.map { |show| show.actors }.flatten).uniq
    shows_by_actor_hash = Hash.new
    actors.each do |actor|
      @shows.each do |show|
        if show.actors.include?(actor) && shows_by_actor_hash[actor]
          shows_by_actor_hash[actor] << show.name
        elsif show.actors.include?(actor)
          shows_by_actor_hash[actor] = [show.name]
        end
      end
    end
    shows_by_actor_hash
  end

  def prolific_actors
    actors = (@shows.map { |show| show.actors }.flatten).uniq
    actors.select do |actor|
      shows_by_actor[actor].length > 1
    end
  end
end
