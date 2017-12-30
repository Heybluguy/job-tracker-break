require 'rails_helper'

describe "as a user" do
  scenario "I can update a job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Engineering")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "New York City"
    select("Engineering", :from => "job[category_id]")

    click_button "Update Job"
    expect(page).to have_content("New York City")
  end

end
