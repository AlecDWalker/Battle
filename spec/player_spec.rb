require 'Player'

describe Player do

  subject(:player) {described_class.new("Andy")}

  it 'returns its name' do
    expect(player.name).to eq "Andy"
  end

  describe '#receive_damage' do
    it "reduces attacked player's HP by 10" do
      player.receive_damage(1)
      expect(player.hit_points).to eq 50
    end
  end
end
