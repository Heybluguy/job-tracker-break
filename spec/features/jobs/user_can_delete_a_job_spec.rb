require 'rails_helper'

describe "as a user" do
  scenario "I can delete a job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Engineering")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_jobs_path(company, job)
    click_on "Delete"

    expect(page).not_to have_content("Developer")
    expect(current_path).to eq("/companies/#{company.id}/jobs")
  end
end


# A user can delete a job