class Company < ApplicationRecord
  has_one_attached :logo
  validates :name, :description, :address, :cnpj, :site, :linkedin, presence: true
end
