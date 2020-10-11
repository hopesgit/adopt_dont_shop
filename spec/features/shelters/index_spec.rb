require 'rails_helper'

describe "As a user" do
  describe "When I go to the shelter index" do
    it "has this content" do
      shelter1 = Shelter.create({
        name: "Bark Bin",
        address: "4656 Nature Way",
        city: "McAllen",
        state: "TX",
        zip: "75319"
        })
      visit("/shelters")

      expect(page).to have_content("All Shelters")
      expect(page).to have_content("New Shelter")
      expect(page).to have_content("#{shelter1.name}")
      expect(page).to have_content("#{shelter1.address}")
      expect(page).to have_content("#{shelter1.city}, #{shelter1.state} #{shelter1.zip}")
      expect(page).to have_content("More information")
    end
  end

  describe "when I click this link" do
    it "More information" do
      shelter1 = Shelter.create({
        name: "Bark Bin",
        address: "4656 Nature Way",
        city: "McAllen",
        state: "TX",
        zip: "75319"
        })
      visit("/shelters")

      expect(page).to have_link("More information")
      click_link("More information")
      expect(current_path).to eq("/shelters/#{shelter1.id}")
    end

    it "New Shelter" do
      visit("/shelters")

      expect(page).to have_link("New Shelter")
      click_link('New Shelter')
      expect(current_path).to eq("/shelters/new")
      expect(page).to have_content("ZIP Code:")
    end
  end
end
