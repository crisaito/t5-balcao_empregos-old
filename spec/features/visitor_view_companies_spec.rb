require 'rails_helper'

feature 'Visitor view companies' do
  scenario 'successfully' do
    Company.create!(name: 'Pepsi', description: 'Empresa de bebidas', 
                    address: 'São Paulo, SP', cnpj: '31.565.104/0001-77', 
                    site: 'www.pepsico.com.br', 
                    linkedin: 'www.linkedin.com/company/pepsico')
    Company.create!(name: 'Guaraná', description: 'Guaraná do Brasil', 
                    address: 'São Paulo, SP', cnpj: '07.526.557/0001-00', 
                    site: 'www.guarana.com.br', 
                    linkedin: 'www.linkedin.com/company/guarana')
   
    visit root_path
    click_on 'Empresas'
    
    expect(page).to have_content('Pepsi')
    expect(page).to have_content('Empresa de bebidas')
    expect(page).to have_content('São Paulo, SP')
    expect(page).to have_content('31.565.104/0001-77')
    expect(page).to have_content('www.pepsico.com.br')
    expect(page).to have_content('www.linkedin.com/company/pepsico')
  end
end