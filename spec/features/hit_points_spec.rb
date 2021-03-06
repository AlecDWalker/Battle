# frozen_string_literal: true

feature 'Hit_Points' do
  scenario "show player 1's HP" do
    sign_in_and_play
    expect(page).to have_content 'Dave: 60HP'
  end
  scenario "show player 2's HP" do
    sign_in_and_play
    expect(page).to have_content 'Mittens: 60HP'
  end
end
