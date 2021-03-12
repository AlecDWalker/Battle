feature 'Game over' do
  context 'Game over if player 1 reached 0HP first' do
    scenario 'Player 2 loses' do
      sign_in_and_play
      10.times {attack_and_confirm}
      click_button 'Attack'
      expect(page).to have_content "Mittens loses!"
    end

    scenario 'Restart game' do
      sign_in_and_play
      10.times {attack_and_confirm}
      click_button 'Attack'
      click_button 'Start Again?'
      expect(page).to have_content "Sign in to play"
    end
  end
end
