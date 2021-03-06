# frozen_string_literal: true

feature 'Game over' do
  context 'Game over if player 1 reached 0HP first' do
    scenario 'Player 2 loses' do
      sign_in_and_play
      10.times { attack_and_confirm }
      click_button 'Safe attack'
      expect(page).to have_content 'Mittens loses!'
    end

    scenario 'Restart game' do
      sign_in_and_play
      10.times { attack_and_confirm }
      click_button 'Safe attack'
      click_button 'Start Again?'
      expect(page).to have_content 'Please choose a game type'
    end
  end
end
