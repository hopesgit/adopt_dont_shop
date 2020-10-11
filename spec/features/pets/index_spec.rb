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
end
