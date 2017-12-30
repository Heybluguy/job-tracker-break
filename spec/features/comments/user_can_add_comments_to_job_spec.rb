require 'rails_helper'

describe "as a user" do
  scenario "i can can add comments to a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    visit company_job_path(company, job)

    fill_in "comment[content]",	with: "Spoke to hiring manager, Jacob. Plan to follow up Monday."
    click_on "Post Comment"
save_and_open_page
    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Spoke to hiring manager, Jacob. Plan to follow up Monday.")
  end
end
