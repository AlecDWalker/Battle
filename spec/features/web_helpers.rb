# frozen_string_literal: true

def sign_in_and_play
  visit('/')
  fill_in :player1, with: 'Dave'
  fill_in :player2, with: 'Mittens'
  click_button 'Start 2 player game'
end

def attack_and_confirm
  click_button 'Safe attack'
  click_button 'OK'
end
