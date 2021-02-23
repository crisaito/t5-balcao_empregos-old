require 'rails_helper'

describe Recruiter do
  context 'validation' do
    it 'company name eq to domain email address' do
      recruiter = Recruiter.create!(email: 'saito@cocacola.com', password: '123456')
      
      expect(recruiter.company_name).to eq 'Cocacola'

    end
  end
end