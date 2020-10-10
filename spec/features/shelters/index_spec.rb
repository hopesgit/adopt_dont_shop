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
      expect(page).to have_content("#{shelter1.name}")
      expect(page).to have_content("#{shelter1.address}")
      expect(page).to have_content("#{shelter1.city}, #{shelter1.state} #{shelter1.zip}")
      expect(page).to have_link("More information")

    end
  end
end
