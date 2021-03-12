require 'game'

describe Game do

  subject(:game){described_class.new(player1, player2)}
  let(:finished_game) {described_class.new(dead_player, player2)}
  let(:player1) { double :player , hit_points: 60 }
  let(:player2) { double :player , hit_points: 60 }
  let(:dead_player) {double :player , hit_points: 0}

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
      game.attack(player2, 1)
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
  describe '#Game_over' do
    it 'returns false if both players are still alive' do
      expect(game.game_over?).to be false
    end

    it 'returns true if player1 is at 0 HP' do
      expect(finished_game.game_over?).to be true
    end
  end

  describe '#loser' do
    it 'returns a player on 0HP or less' do
      expect(finished_game.loser).to eq dead_player
    end
  end
end
