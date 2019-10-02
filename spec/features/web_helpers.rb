def sign_in_and_play
  visit('/')
  fill_in :name1, with: 'Dave'
  fill_in :name2, with: 'Mittens'
  click_button "Ready!"
end
