require 'rails_helper'

describe "As a user" do
  describe "when I visit a shelter's show page" do
    it "has this content" do
      shelter1 = Shelter.create({name: "Pound Town", address: "3564 June Ct", city: "Springfield", state: "MO", zip: "65432"})
      # shelter2 = Shelter.create({name: "ASPCA", address: "8765 Carryover Ct", city: "Richmond", state: "VA", zip: "68768"})
      visit("/shelters")
      click_on("More information")
      expect(page).to have_content("#{shelter1.name}")
      click_on("Delete")
      expect(current_path).to eq("/shelters")
      # expect(page).to have_content("#{shelter2.name}")
      expect(page).to not_have_content("#{shelter1.name}")
    end
  end
end
