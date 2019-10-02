require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    p params
    $Player1 = Player.new(params[:name1])
    $Player2 = Player.new(params[:name2])
    redirect '/play'
  end

  get '/play' do
    @name1 = $Player1.name
    @name2 = $Player2.name
    erb :play
    end

  get '/attack' do
    @name1 = $Player1.name
    @name2 = $Player2.name
    erb :attack
  end

  run! if app_file == $0
end
