require 'rails_helper'

describe Recruiter do
  context 'validation' do
    it 'company name eq to domain email address' do
      recruiter = Recruiter.create!(email: 'saito@cocacola.com', password: '123456')
      
      expect(recruiter.company_name).to eq 'Cocacola'

    end

    it 'company name eq to domain email address' do
      recruiter1 = Recruiter.create!(email: 'um@dolly.com', password: '123456')
      recruiter2 = Recruiter.create!(email: 'dois@cocacola.com', password: '123456')
      recruiter3 = Recruiter.create!(email: 'tres@cocacola.com', password: '123456')

      
      expect(recruiter3.company_id).to eq 2

    end
  end
end