class Company < ApplicationRecord
  has_one_attached :logo
  has_many :jobs
  
  validates :name, :description, :address, :cnpj, :site, :linkedin, presence: true
  validates :cnpj, uniqueness: true
end
