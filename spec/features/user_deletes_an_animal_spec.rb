require 'spec_helper'

# In order to track animals at the zoo,
# as a zookeeper,
# I want to delete an animal

feature "user deletes an animal", js: true do
  scenario "deleting successfully" do
    cat = Animal.create(species: 'cat', color: 'orange')
    dog = Animal.create(species: 'dog', color: 'black')

    visit animals_path

    within('.cat') do
      click_link 'Delete'
    end

    expect(page).to_not have_content('cat')
    expect(page).to_not have_content('orange')

    expect(page).to have_content('dog')
    expect(page).to have_content('black')
    expect(page).to have_content('The animal was deleted!')

    expect(current_path).to eql animals_path
  end
end