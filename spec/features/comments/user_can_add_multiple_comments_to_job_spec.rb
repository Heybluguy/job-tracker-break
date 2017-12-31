require 'rails_helper'

describe "as a user" do
  scenario "i can can add multiple comments to a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    visit company_job_path(company, job)

    fill_in "comment[content]",	with: "Spoke to hiring manager, Jacob. Plan to follow up Monday."
    click_on "Post Comment"
    fill_in "comment[content]",	with: "Hiring manager wants to do coffee."
    click_on "Post Comment"
save_and_open_page
    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Spoke to hiring manager, Jacob. Plan to follow up Monday.")
  end
end

# The user can leave multiple comments on a job 
# and the most recent comments are shown above older comments (in reverse of the order in which they were created).