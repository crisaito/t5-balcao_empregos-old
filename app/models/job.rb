class Job < ApplicationRecord
  belongs_to :company

  validates :title, :description, :compensation, :experience_level, :requirements, :expiration_date, :total_jobs, presence: true
end
