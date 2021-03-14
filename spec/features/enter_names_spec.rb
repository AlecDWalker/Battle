# frozen_string_literal: true

feature 'Names' do
  scenario "submit players' names" do
    sign_in_and_play
    expect(page).to have_content 'Dave vs. Mittens'
  end

  scenario 'submit one name for a PvC game' do
    visit('/')
    fill_in :player, with: 'Dave'
    click_button 'Start 1 player game'
    expect(page).to have_content 'Dave vs. Computer'
  end
end
