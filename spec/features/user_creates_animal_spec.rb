require 'spec_helper'

# In order to track animals at the zoo,
# as a zookeeper,
# I want to create an animal

feature "user creates animal", js: true do
  context "successfully" do
    scenario "creating an animal" do
      visit '/animals/new'

      fill_in 'Species', with: 'frog'
      fill_in 'Color', with: 'green'

      click_button 'save'

      expect(page).to have_content 'frog'
      expect(page).to have_content 'green'
      expect(current_path).to eql animals_path
    end
  end

  context "unsuccessfully" do
    scenario "attempt to create an animal" do
      visit new_animal_path

      fill_in 'Color', with: 'green'

      click_button 'save'

      expect(Animal.count).to eql 0
      expect(page).to have_content 'Uh oh!'
    end
  end
end