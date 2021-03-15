# frozen_string_literal: true

require 'Player'

describe Player do
  subject(:player) { described_class.new('Andy') }

  it 'returns its name' do
    expect(player.name).to eq 'Andy'
  end

  it 'is initializsed with full health and so status effects' do
    expect(player.hit_points).to eq 60
    expect(player.paralysed).to eq false
    expect(player.poisoned).to eq false
    expect(player.asleep).to eq false
  end

  describe '#receive_damage' do
    it "reduces attacked player's HP by 10" do
      player.receive_damage(10)
      expect(player.hit_points).to eq 50
    end
  end
end

describe Computer do
  subject(:computer) { Computer.new }

  it 'inherits default features from the Player class' do
    expect(computer.name).to eq 'Computer'
    expect(computer.hit_points).to eq 60
  end
end
