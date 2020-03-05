require 'rails_helper'

feature 'Admin register a restaurant' do
  scenario 'successfully' do
    create(:cuisine)
    user = create(:user)
    login_as(user, scope: :user)

    visit restaurants_path
    click_on 'Novo restaurante'
    fill_in 'Nome:', with: 'Paulistano'
    fill_in 'Endereço:', with: 'Rua de Paulista, 11'
    fill_in 'Bairro:', with: 'Centro'
    fill_in 'Cidade:', with: 'São Paulo'
    fill_in 'Telefone:', with: '11 2345-5423'
    fill_in 'Telefone2:', with: '11 4312-1234'
    fill_in 'Custo:', with: '100.95'
    fill_in 'Horários:', with: 'Todos os dias 24h'
    fill_in 'Happy hour:', with: 'Qui-Sex 18h ás 22h'
    fill_in 'Latitude:', with: '51.501564'
    fill_in 'Longitude:', with: '-0.141944'
    select 'Italiana', from: 'Cozinha'
    click_on 'Salvar'

    expect(page).to have_content('Paulistano')
    expect(page).to have_content('Rua de Paulista, 11')
    expect(page).to have_content('11 2345-5423')
    expect(page).to have_content('Todos os dias 24h')
    expect(page).to have_content('Restaurante criado com sucesso!')
    expect(page).to have_content('Voltar')
  end
  scenario 'validates empty fields' do
    create(:cuisine, name: 'Brasileira')
    user = create(:user)
    login_as(user, scope: :user)

    visit restaurants_path
    click_on 'Novo restaurante'
    fill_in 'Nome:', with: ''
    fill_in 'Endereço:', with: ''
    fill_in 'Bairro:', with: ''
    fill_in 'Cidade:', with: ''
    fill_in 'Telefone:', with: ''
    fill_in 'Telefone2:', with: ''
    fill_in 'Custo:', with: ''
    fill_in 'Horários:', with: ''
    fill_in 'Happy hour:', with: ''
    fill_in 'Latitude:', with: ''
    fill_in 'Longitude:', with: ''
    select 'Brasileira', from: 'Cozinha'
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar:')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
    expect(page).to have_content('Bairro não pode ficar em branco')
    expect(page).to have_content('Cidade não pode ficar em branco')
    expect(page).to have_content('Telefone não pode ficar em branco')
    expect(page).to have_content('Voltar')
  end
end
