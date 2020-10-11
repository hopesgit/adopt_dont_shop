require 'rails_helper'

describe "As a user" do
  describe "When looking at a Shelter's show page" do
    it "has an edit button" do
      shelter1 = Shelter.create({
        name: "Bark Bin",
        address: "4656 Nature Way",
        city: "McAllen",
        state: "TX",
        zip: "75319"
        })

      visit("/shelters/#{shelter1.id}")

      expect(page).to have_link("Edit")
      click_on("Edit")
      expect(current_path).to eq("/shelters/#{shelter1.id}/edit")
    end
  end

  describe "When looking at a shelter's edit page" do
    it "has things for me to fill out" do
      shelter1 = Shelter.create({
        name: "Bark Bin",
        address: "4656 Nature Way",
        city: "McAllen",
        state: "TX",
        zip: "75319"
        })

      visit("shelters/#{shelter1.id}/edit")

      fill_in("name", :with => "Dumb Friends League")
      fill_in("address", :with => "1111 Test Dr")
      fill_in("city", :with => "Denver")
      fill_in("state", :with => "CO")
      fill_in("zip", :with => "80231")
      click_button("Submit")

      expect(current_path).to eq("/shelters/#{shelter1.id}")
      expect(page).to have_content("Dumb Friends League")
      expect(page).to have_content("1111 Test Dr")
      expect(page).to have_content("Denver, CO 80231")
    end
  end
end
