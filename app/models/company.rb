class Company < ApplicationRecord
  has_one_attached :logo
  has_many :jobs
  has_many :recruiters
  
  validates :name, :description, :address, :cnpj, :site, :linkedin, presence: true
  validates :cnpj, uniqueness: true

  before_create :validate_company_length

  def validate_company_length
    if Company.pluck(:name).include?(self.name)
      throw(:abort)
    end
  end
  
end
