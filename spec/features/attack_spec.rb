feature 'Attack' do

  scenario "PLayers have 3 seprate atack options" do
    sign_in_and_play
    expect(page).to have_button 'Attack'
    expect(page).to have_button 'Safe attack'
    expect(page).to have_button 'Risky attack'
  end
  scenario "Player1 attacks Player2" do
    sign_in_and_play
    click_button 'Safe attack'
    expect(page).to have_content 'Dave attacked Mittens'
  end
  scenario 'be attacked by Player 2' do
    sign_in_and_play
    attack_and_confirm
    click_button 'Attack'
    expect(page).to have_content 'Mittens attacked Dave'
  end
  scenario 'reduce Player 1 HP by 10' do
    sign_in_and_play
    2.times {attack_and_confirm}
    expect(page).not_to have_content 'Dave: 60HP'
    expect(page).to have_content 'Dave: 50HP'
  end
end
