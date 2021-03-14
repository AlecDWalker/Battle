# frozen_string_literal: true

class Player
  DEFAULT_HIT_POINTS = 60
  attr_reader :name, :hit_points

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @hit_points = hit_points
    if self.is_a?(Computer)
      @name = 'Computer'
    else
      @name = name
    end
  end

  def receive_damage(damage)
    @hit_points -= damage
  end
end

class Computer < Player
end
