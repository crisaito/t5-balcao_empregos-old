require 'rails_helper'

describe Company do
  context 'validation' do
    it 'fields cannot be blank' do
      company = Company.new
      
      expect(company.valid?).to eq false
      expect(company.errors.count).to eq 6
    end
    
    it 'error messages are in portuguese' do
      company = Company.new
      company.valid?

      expect(company.errors[:name]).to include('não pode ficar em branco')
      expect(company.errors[:description]).to include('não pode ficar em branco')
      expect(company.errors[:address]).to include('não pode ficar em branco')
      expect(company.errors[:cnpj]).to include('não pode ficar em branco')
      expect(company.errors[:site]).to include('não pode ficar em branco')
      expect(company.errors[:linkedin]).to include('não pode ficar em branco') 
    end

    it 'CNPJ already exists' do
      Company.create!(name: 'Guaraná', description: 'Guaraná do Brasil', 
                      address: 'São Paulo, SP', cnpj: '07.526.557/0001-00', 
                      site: 'www.guarana.com.br', 
                      linkedin: 'www.linkedin.com/company/guarana')
      company = Company.new(cnpj: '07.526.557/0001-00')

      company.valid?

      expect(company.errors[:cnpj]).to include('já está em uso')
    end
  end
end
