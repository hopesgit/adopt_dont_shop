require 'rails_helper'

describe "As a user" do
  describe "when I load up the site" do
    it "should show this:" do
      visit("/")

      expect(page).to have_content("Welcome to Adopt, Don't Shop!")
      expect(page).to have_content("Shelters")
      expect(page).to have_content("Shelter Index")
      expect(page).to have_content("New Shelter")
      expect(page).to have_content("Pets")
      expect(page).to have_content("Pet Index")
      expect(page).to have_content("New Pet")
    end
  end

  describe "when I click on this link:" do
    it "Shelter index" do
      visit("/")

      expect(page).to have_link("Shelter Index")
      click_link("Shelter Index")
      expect(page).to have_content("All Shelters")
    end

    it "New Shelter" do
      visit("/")

      expect(page).to have_link("New Shelter")
      click_link('New Shelter')
      expect(page).to have_content("ZIP Code:")
    end

    it "Pet Index" do
      visit("/")

      expect(page).to have_link("Pet Index")
      click_link("Pet Index")
      expect(page).to have_content("All Pets")
    end

    it "New Pet" do
      visit("/")

      expect(page).to have_link("New Pet")
      click_link("New Pet")
      expect(page).to have_content("Pet Name:")
    end
  end
end
