require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end

describe "as a user" do
  describe "when I create a job" do
    scenario "require me to select its Category from a drop down menu of existing categories and see a link to create a new Category" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Production")
      category = Category.create!(title: "Accounting")
      visit new_company_job_path(company)

      fill_in "job[title]", with: "Production"
      fill_in "job[description]", with: "So fun!"
      fill_in "job[level_of_interest]", with: 80
      fill_in "job[city]", with: "Denver"
      select('Production', :from => 'job[category_id]')

      click_button "Create"

      expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
      expect(page).to have_content("Production")
      expect(page).to have_content("ESPN")
      expect(page).to have_content("80")
      expect(page).to have_content("Denver")
      expect(page).to have_content("So fun!")
    end
  end
end

#  When the user creates a new Job,
#  they are required to select its Category from a drop down menu of existing categories.
#   They also see a link to create a new Category.

