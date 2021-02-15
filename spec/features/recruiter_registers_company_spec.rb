require 'rails_helper'

feature 'Recruiter registers company' do
  scenario 'from index page' do
    visit root_path
    click_on 'Empresas'

    expect(page).to have_link('Cadastrar empresa',
                               href: new_company_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Empresas'
    click_on 'Cadastrar empresa'

    fill_in 'Nome', with: 'Pepsi'
    fill_in 'Descrição', with: 'Empresa de bebidas'
    fill_in 'Endereço', with: ' São Paulo, SP'
    fill_in 'CNPJ', with: '31.565.104/0001-77'
    fill_in 'Site', with: 'www.pepsico.com.br'
    fill_in 'Linkedin', with: 'www.linkedin.com/company/pepsico'
    attach_file 'Logo', Rails.root.join('spec', 'support', 'logo.png')
    click_on 'Cadastrar Empresa'

    expect(current_path).to eq(company_path(Company.last))
    expect(page).to have_content('Pepsi')
    expect(page).to have_content('Empresa de bebidas')
    expect(page).to have_content('São Paulo, SP')
    expect(page).to have_content('31.565.104/0001-77')
    expect(page).to have_content('www.pepsico.com.br')
    expect(page).to have_content('www.linkedin.com/company/pepsico')
    expect(page).to have_css('img[src*="logo.png"]')
    expect(page).to have_link('Voltar')
  end

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
    expect(page).to have_content('Preencha todos os campos')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('Site não pode ficar em branco')
    expect(page).to have_content('Linkedin não pode ficar em branco')
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
    click_on 'Cadastrar Empresa'

    expect(page).to have_content('CNPJ já está em uso')
                  
  end
end