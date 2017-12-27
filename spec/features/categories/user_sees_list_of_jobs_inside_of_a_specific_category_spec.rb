require 'rails_helper'

describe "as a user" do
  describe "when I visit a page for a specific category" do
    scenario "I see a list of jobs in that category" do
      company = Company.create(name: "ESPN")
      category = Category.create(title: "Production")
      job = category.jobs.create(title: "Makeup Artist", level_of_interest: 70, city: "Denver", company: company)
      job_2 = category.jobs.create(title: "Camera Technician", level_of_interest: 70, city: "Denver", company: company)

      visit category_path(category)

      expect(page).to have_content("Makeup Artist")
      expect(page).to have_content("Camera Technician")
    end
  end
end


# When the user
#  visits a page for a specific Category,
#  they see a list of Jobs in that Category.