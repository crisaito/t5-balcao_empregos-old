require 'rails_helper'

describe Recruiter do
  context 'validation' do
    it 'company_name from domain email address' do
      recruiter = Recruiter.create!(email: 'ana@coca.com.br', password: '123456')
      
      expect(recruiter.company_name).to eq 'Coca'
    end
  end
end