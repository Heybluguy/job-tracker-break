require 'rails_helper'

describe "as a user" do
  scenario "when I try to create a category that already exists" do
    it "im brought back to create category form page" do
      category = Category.create(title: "Automotive")

      visit new_category_path
      # fill_in "Title", with: "Automotive"
      fill_in "category[title]", with: "Automotive"
      click_button "Create"

      expect(page).to have_content("Title")
      expect(current_path).to eq("/categories/new")
    end
  end
end

# When the user
# tries to create a Category that already exists,
#  they are brought back to the page with the form to create a Category.