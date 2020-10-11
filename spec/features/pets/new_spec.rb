require 'rails_helper'

describe "As a user" do
  describe "When I want to create a new pet" do
    it "can be found here" do
      visit("/")
      click_link("New Pet")
      expect(current_path).to eq("/pets/new")
      expect(page).to have_content("Pet Name:")
    end
  end

  describe "it has a form to fill out" do
    it "will fill out the form" do
      visit("/pets/new")
      fill_in("name", :with => "Boney")
      fill_in("image", :with => "https://live.staticflickr.com/2593/4146369224_c08b539596_b.jpg")
      fill_in("description", :with => "I'm a kind and lighthearted dog with a constant need for attention!")
      fill_in("age", :with => 5)
      choose("Male")
      choose("Adopted")
      click_on("Submit")

      expect(current_path).to eq("/pets")
      expect(page).to have_content("Boney")
      expect(page).to have_content("I'm a kind and lighthearted dog with a constant need for attention!")
      expect(page).to have_content("Age: 5")
      expect(page).to have_content("Sex: Male")
      expect(page).to have_content("Status: Adopted")
    end
  end
end
