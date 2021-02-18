require 'rails_helper'

feature 'Recruiter registers job' do
  scenario 'from index page' do
    Company.create!(name: 'Pepsi', description: 'Empresa de bebidas', 
                    address: 'São Paulo, SP', cnpj: '31.565.104/0001-77', 
                    site: 'www.pepsico.com.br', 
                    linkedin: 'www.linkedin.com/company/pepsico')
    
    visit root_path
    click_on 'Empresas'
    click_on 'Pepsi'

    expect(page).to have_link('Cadastrar vaga', href: new_company_job_path(Company.last))
  end

  scenario 'sucessfully' do
    Company.create!(name: 'Pepsi', description: 'Empresa de bebidas', 
                    address: 'São Paulo, SP', cnpj: '31.565.104/0001-77', 
                    site: 'www.pepsico.com.br', 
                    linkedin: 'www.linkedin.com/company/pepsico')


    visit root_path
    click_on 'Empresas'
    click_on 'Pepsi'
    click_on 'Cadastrar vaga'
    
    fill_in 'Título da vaga', with: 'Senior developer'
    fill_in 'Descrição', with: 'Principais Atividades: Desenvolver serviços web'
    fill_in 'Salário', with: '10000'
    fill_in 'Nível', with: 'Senior'
    fill_in 'Requisitos', with: 'Foco em performance, Ruby on Rails'
    fill_in 'Data de expiração da vaga', with: '21/02/2021'
    fill_in 'Total de vagas', with: '5'
    click_on 'Cadastrar Vaga'
    click_on 'Senior developer'

    expect(current_path).to eq(company_job_path(Company.last, Job.last))
    expect(page).to have_content('Senior developer')
    expect(page).to have_content('Principais Atividades: Desenvolver serviços web')
    expect(page).to have_content('R$ 10.000,00')
    expect(page).to have_content('Senior')
    expect(page).to have_content('Foco em performance, Ruby on Rails')
    expect(page).to have_content('21/02/2021')
    expect(page).to have_content('5')
    expect(page).to have_link('Voltar')
  end

  scenario 'and attributes cannot be blank' do
    Company.create!(name: 'Pepsi', description: 'Empresa de bebidas', 
                    address: 'São Paulo, SP', cnpj: '31.565.104/0001-77', 
                    site: 'www.pepsico.com.br', 
                    linkedin: 'www.linkedin.com/company/pepsico')

    visit root_path
    click_on 'Empresas'
    click_on 'Pepsi'
    click_on 'Cadastrar vaga'
    
    fill_in 'Título da vaga', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Salário', with: ''
    fill_in 'Nível', with: ''
    fill_in 'Requisitos', with: ''
    fill_in 'Data de expiração da vaga', with: ''
    fill_in 'Total de vagas', with: ''
    click_on 'Cadastrar Vaga'

    expect(Job.count).to eq 0
    expect(page).to have_content('Preencha todos os campos')
    expect(page).to have_content('Título da vaga não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Salário não pode ficar em branco')
    expect(page).to have_content('Nível não pode ficar em branco')
    expect(page).to have_content('Requisitos não pode ficar em branco')
    expect(page).to have_content('Data de expiração da vaga não pode ficar em branco')
    expect(page).to have_content('Total de vagas não pode ficar em branco')
 
  end
end

