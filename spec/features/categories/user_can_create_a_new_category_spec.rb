require 'rails_helper'

describe "as a user" do
  it "i can create a new category with a form" do

    visit new_category_path
    fill_in "Title", with: "Automotive"
    click_button "Create"

    expect(page).to have_content("Automotive")
  end
end


# [] The user can create a new Category by filling out a form.
#  Each Category has a title (e.g. “Web Development”, “Education”, “Finance”).