# frozen_string_literal: true

class Player
  DEFAULT_HIT_POINTS = 60
  attr_reader :name, :hit_points

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @hit_points = hit_points
    @name = name
  end

  def receive_damage(damage)
    @hit_points -= damage
  end
end

class Computer < Player
  def initialize
    @name = 'Computer'
    @hit_points = DEFAULT_HIT_POINTS
  end
end
