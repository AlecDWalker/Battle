# frozen_string_literal: true

feature 'Attack' do
  scenario 'Players have multiple attack options' do
    sign_in_and_play
    expect(page).to have_button 'Attack'
    expect(page).to have_button 'Safe attack'
    expect(page).to have_button 'Risky attack'
    expect(page).to have_button 'Poison attack'
    expect(page).to have_button 'Sleep attack'
    expect(page).to have_button 'Paralyse attack'
  end
  scenario 'Player1 attacks Player2' do
    sign_in_and_play
    click_button 'Safe attack'
    expect(page).to have_content 'Dave attacked Mittens'
  end
  scenario 'Player1 is attacked by Player 2' do
    sign_in_and_play
    attack_and_confirm
    click_button 'Attack'
    expect(page).to have_content 'Mittens attacked Dave'
  end
  scenario 'Computer opponent attacks back automatically' do
    visit('/')
    fill_in :player, with: 'Dave'
    click_button 'Start 1 player game'
    attack_and_confirm
    click_button 'Okay'
    expect(page).to have_content 'Computer attacked Dave'
  end
  scenario 'reduce Player 1 HP by 10 when attacked' do
    sign_in_and_play
    2.times { attack_and_confirm }
    expect(page).not_to have_content 'Dave: 60HP'
    expect(page).to have_content 'Dave: 50HP'
  end
end
