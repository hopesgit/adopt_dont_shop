require 'rails_helper'

describe "As a user" do
  describe "when I load up the site" do
    it "should show this:" do
      visit("/")

      expect(page).to have_content("Welcome to Adopt, Don't Shop!")
      expect(page).to have_content("Shelters")
      expect(page).to have_content("Shelter Index")
      expect(page).to have_content("Pets")
      expect(page).to have_content("Pet Index")
    end
  end

  describe "when I click on this link:" do
    it "Shelter index" do
      visit("/")

      expect(page).to have_link("Shelter Index")
      click_link("Shelter Index")
      expect(page).to have_content("All Shelters")
    end

    it "Pet Index" do
      visit("/")

      expect(page).to have_link("Pet Index")
      click_link("Pet Index")
      expect(page).to have_content("All Pets")
    end
  end
end
