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
      expect(page).to have_content("ASPCA")
      expect(page).to have_content("123 Example Ln")
      expect(page).to have_content("Denver, CO 80010")
    end
  end
end
