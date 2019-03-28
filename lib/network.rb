require './lib/show'

class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def all_characters
    all_chars = @shows.map do |show|
      show.characters
    end

    all_chars.flatten
  end

  def highest_paid_actor
    highest_paid_character = all_characters.max_by {|character| character.salary}
    highest_paid_character.actor
  end

  def payroll
    payroll_hash = {}

    all_characters.each do |character|
      payroll_hash[character.actor] = character.salary
    end

    payroll_hash
  end
end
