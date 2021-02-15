require 'rails_helper'

feature 'Recruiter register a valid company' do
  scenario 'and fields cannot be blank' do
    
    visit root_path
    click_on 'Empresas'
    click_on 'Cadastrar empresa'

    fill_in 'Nome', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Site', with: ''
    fill_in 'Linkedin', with: ''
    click_on 'Cadastrar Empresa'

    expect(Company.count).to eq 0
    expect(page).to have_content('preencha todos os campos')
  end

  scenario 'and CNPJ must be unique' do
    Company.create!(name: 'Pepsi', description: 'Empresa de bebidas', 
                    address: 'São Paulo, SP', cnpj: '31.565.104/0001-77', 
                    site: 'www.pepsico.com.br', 
                    linkedin: 'www.linkedin.com/company/pepsico') 

    visit root_path
    click_on 'Empresas'
    click_on 'Cadastrar empresa'    
    fill_in 'CNPJ', with: '31.565.104/0001-77'
    click_on 'Cadastrar empresa'

    expect(page).to have_content('CNPJ já existe')
                  
  end
end