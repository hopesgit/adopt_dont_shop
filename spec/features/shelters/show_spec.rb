describe "As a user" do
  describe "When I click on the 'More information' link" do
    it "takes me here" do
      shelter1 = Shelter.create({
                              name: "ASPCA",
                              address: "123 Example Ln",
                              city: "Denver",
                              state: "CO",
                              zip: "80010"
                              })
      visit("/shelters")
      click_link("More information")

      expect(page).to have_link("Shelter Index")
      expect(page).to have_content("#{shelter1.name}")
      expect(page).to have_content("#{shelter1.address}")
      expect(page).to have_content("#{shelter1.city}, #{shelter1.state} #{shelter1.zip}")
    end

    it "has these links" do
      shelter1 = Shelter.create({
                                name: "ASPCA",
                                address: "123 Example Ln",
                                city: "Denver",
                                state: "CO",
                                zip: "80010"
                                })
      visit("/shelters")
      click_link("More information")

      expect(current_path).to eq("/shelters/#{shelter1.id}")
      expect(page).to have_link("Shelter Index")
      expect(page).to have_link("Edit")
      expect(page).to have_button("Delete")
    end
  end
end
