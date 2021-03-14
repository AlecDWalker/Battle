feature 'Start' do
  scenario 'Player is given the option of a human or somputer opponent' do
    visit('/')
    expect(page).to have_content 'Player vs Player'
    expect(page).to have_content 'Player vs Computer'
  end
end
