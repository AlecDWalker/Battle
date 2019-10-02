require 'Player'

describe Player do

  subject(:player) {described_class.new("Andy")}

  describe '#attack' do
    it 'returns its name' do
      expect(player.name).to eq "Andy"
    end
  end

  describe '#receive_damage' do
    it "reduces attacked player's HP by 10" do
      player.receive_damage
      expect(player.hit_points).to eq 50
    end
  end

  # describe '#hit_points' do
  #   it ''
  #   expect(player.hit_points).to eq 60
  # end
end
