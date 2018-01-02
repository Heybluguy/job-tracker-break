class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments

  def self.grouped_levels_of_interests
    interest_range = [(0..10), (11..20), (21..30), (31..40), (41..50), (51..60), (61..70), (71..80), (81..90), (91..100)]
    count = interest_range.map do |range|
      Job.where(:level_of_interest => range).count
    end
    interest_range.zip(count)
  end
end