require 'rails_helper'

describe "As a user" do
  describe "when I load up the site" do
    it "should show this:" do
      visit("/")

      expect(page).to have_content("Welcome to Adopt, Don't Shop!")
      expect(page).to have_content("Shelters")
      expect(page).to have_link("Shelter Index")
      expect(page).to have_link("New Shelter")
      click_link('New Shelter')
      expect(page).to have_content("New Shelter")
    end
  end
end
