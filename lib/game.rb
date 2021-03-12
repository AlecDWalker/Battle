require_relative 'Player'

class Game
  attr_reader :player1 , :player2, :current_turn , :game_over

  def initialize(player1, player2)
   @player1 = player1
   @player2 = player2
   @players = [player1, player2]
   @current_turn = player1
   @game_over = false
  end

  def attack(player, damage = 10)
    player.receive_damage(damage)
  end

  def current_turn
    @current_turn
  end

  def switch_turns
  @current_turn = opponent_of(@current_turn)
end

def opponent_of(the_player)
  @players.select { |player| player != the_player }.first
  end

def game_over?
  losing_players.any?
  end

  def loser
    losing_players.first
  end
  private

  def losing_players
    @players.select { |player| player.hit_points <= 0 }
  end
end
