require 'rails_helper'

describe "as a user" do
  describe "I can visit dashboard" do
    scenario "to see a count of jobs by `level_of_interest`" do
      company = Company.create!(name: "ESPN")
      company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      company.jobs.create!(title: "Host", level_of_interest: 70, city: "Miami")
      company.jobs.create!(title: "QA Analyst", level_of_interest: 10, city: "New York City")

      visit "/dashboard"

      expect(page).to have_content("61..70: 2 jobs")
      expect(page).to have_content("0..10: 1 jobs")

    end
  end
end
