require 'rails_helper'

describe "as a user" do
  describe "when I visit a specific company page" do
    scenario "theres is form that allows me to enter a contact for that company" do
      company = Company.create(name: "ESPN")
      visit company_path(company)

      fill_in "contact[full_name]", with: "Luis Senior"
      fill_in "contact[position]", with: "Lead poop shoveler"
      fill_in "contact[email]", with: "heybluguy@aol.com"
      click_on "Submit"

      fill_in "contact[full_name]", with: "Penelope Santorini"
      fill_in "contact[position]", with: "Hiring Manager"
      fill_in "contact[email]", with: "penelope@wooo.com"
      click_on "Submit"

      expect(current_path).to eq(company_path(company))
      expect(page).to have_content("Luis Senior")
      expect(page).to have_content("Lead poop shoveler")
      expect(page).to have_content("heybluguy@aol.com")
    end
  end
end



# When the user visits the page for a specific Company,
#  in addition to information about the job
#  there is a form that allows them to enter a Contact for that Company
#   (e.g. “Penelope Santorini”, “Hiring Manager”, “penelope@wooo.com”).