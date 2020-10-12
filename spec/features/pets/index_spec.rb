require 'rails_helper'

describe "As a user" do
  describe "From the welcome index" do
    it "has links to" do
      visit("/")

      expect(page).to have_link("Pet Index")
      click_link("Pet Index")
      expect(current_path).to eq("/pets")
    end
  end

  describe "from the pets index" do
    it "has this content" do
      visit("/pets")

      expect(page).to have_link("New Pet")
      click_link("New Pet")
      expect(current_path).to eq("/pets/new")
    end

    it "shows pets" do
      shelter1 = Shelter.create({
        name: "Bark Bin",
        address: "4656 Nature Way",
        city: "McAllen",
        state: "TX",
        zip: "75319"
        })
      pet1 = Pet.create(name: "Austin", age: 1, shelter_id: "#{shelter1.id}", sex: "Male", image: "https://live.staticflickr.com/2593/4146369224_c08b539596_b.jpg", adoptability: "Needs a home", description: "Hi there! I'm Austin and I've been barking up the wrong tree! Would you please take me home? I've had all my shots and am ready to bust out of this joint!")

      visit("/pets")

      expect(page).to have_content("#{pet1.name}")
    end
  end
end
