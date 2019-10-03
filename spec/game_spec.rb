require 'game'

describe Game do

  subject(:game){described_class.new(player1, player2)}
  let(:player1){ double :player }
  let(:player2){ double :player }

  describe '#player1' do
   it 'retrieves the first player' do
     expect(game.player1).to eq player1
   end
 end

 describe '#player2' do
   it 'retrieves the second player' do
     expect(game.player2).to eq player2
   end
 end

  describe '#attack' do
    it 'returns the HP of attacked player' do
      expect(player2).to receive(:receive_damage)
      game.attack(player2)
    end
  end

  describe '#current_player' do
    it 'starts as players 1' do
      expect(game.current_turn).to eq player1
    end

    context 'player requests to switch turn' do
      it 'switches the current turn' do
        game.switch_turns
        expect(game.current_turn).to eq player2
      end
    end
  end
end
