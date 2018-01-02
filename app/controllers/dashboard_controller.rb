class DashboardController < ApplicationController
  def index
    @grouped_jobs = Job.grouped_levels_of_interests
  end

end