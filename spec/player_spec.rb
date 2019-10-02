require 'Player'
describe Player do
subject(:player) {described_class.new("Andy")}
it 'returns its name' do
  expect(player.name).to eq "Andy"
end
end
