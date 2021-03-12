require 'sinatra/base'
require_relative './lib/Player'
require_relative './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
    end

  post '/attack' do
    @game = $game
    @game.attack(@game.opponent_of(@game.current_turn), 1)
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    @game = $game
    erb :attack
  end

  post '/switch-turns' do
    @game = $game
    @game.switch_turns
    redirect('/play')
  end

  get '/game-over' do
    @game = $game
    erb :game_over
  end

  run! if app_file == $0
end
