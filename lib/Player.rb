# frozen_string_literal: true

class Player
  DEFAULT_HIT_POINTS = 60
  attr_reader :name, :hit_points, :paralysed, :poisoned, :asleep

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @hit_points = hit_points
    @name = name
    @paralysed = false
    @poisoned = false
    @asleep = false
  end

  def receive_damage(damage)
    @hit_points -= damage
  end

  def becomepoisoned
    @poisoned = true
  end
  
  def becomeasleep
    @asleep = true
  end

  def becomeparalysed
    @paralysed = true
  end
end

class Computer < Player
  def initialize
    @name = 'Computer'
    @hit_points = DEFAULT_HIT_POINTS
  end
end
