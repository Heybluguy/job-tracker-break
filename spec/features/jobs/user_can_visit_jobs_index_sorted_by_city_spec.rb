require 'rails_helper'

describe "as a user" do
  describe "when i visit /jobs?sort=location" do
    scenario "i see a list of the jobs sorted by city" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Host", level_of_interest: 10, city: "Miami")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

      visit "/jobs?sort=location"

      expect(current_path).to eq(jobs_path)
      within(first('.job')) do
        expect(page).to have_content("Developer")
        expect(page).to have_content("Denver")
      end
    end
  end
end
