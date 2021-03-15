# frozen_string_literal: true

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

  post '/name' do
    player1 = Player.new(params[:player])
    player2 = Computer.new
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  post '/attack' do
    @game = $game
    @damage = rand(8..12)
    @game.attack(@game.opponent_of(@game.current_turn), @damage)
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  post '/safeattack' do
    @game = $game
    @damage = 10
    @game.attack(@game.opponent_of(@game.current_turn))
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  post '/riskyattack' do
    @game = $game
    @damage = rand(5..15)
    @game.attack(@game.opponent_of(@game.current_turn), @damage)
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
    redirect '/play'
  end

  get '/game-over' do
    @game = $game
    erb :game_over
  end

  run! if app_file == $PROGRAM_NAME
end
