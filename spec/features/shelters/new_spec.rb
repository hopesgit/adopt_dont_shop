require 'rails_helper'

describe "As a user" do
  describe "When I'm at the shelters index" do
    it "if I click on New Shelter" do
      visit("/shelters")
      click_link("New Shelter")

      expect(current_path).to eq("/shelters/new")
    end
  end

  describe "Once I click the New Shelter link" do
    it "has a form for me to fill out" do
      visit("/shelters/new")

      fill_in("name", :with => "Dumb Friends League")
      fill_in("address", :with => "1111 Test Dr")
      fill_in("city", :with => "Denver")
      fill_in("state", :with => "CO")
      fill_in("zip", :with => "80231")
      click_button("Submit")

      expect(current_path).to eq("/shelters")
      expect(page).to have_content("Dumb Friends League")
      expect(page).to have_content("1111 Test Dr")
      expect(page).to have_content("Denver, CO 80231")
    end
  end
end
