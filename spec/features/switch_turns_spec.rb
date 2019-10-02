feature 'allow players to switch turns' do
  context 'game shows who is currently playing' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content "Dave's turn"
    end

    scenario 'players can switch turns' do
      sign_in_and_play
      click_button "Attack"
      click_link "OK"
      expect(page).not_to have_content "Dave's turn"
      expect(page).to have_content "Mitten's turn"
    end
  end
end