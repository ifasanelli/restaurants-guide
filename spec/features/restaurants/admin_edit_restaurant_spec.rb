require 'rails_helper'

feature 'Admin edit a restaurant' do
  scenario 'successfully' do
    create(:restaurant)
    user = create(:user, role: 9)
    login_as(user, scope: :user)

    visit restaurants_path
    click_on 'Gourmetzão'
    click_on 'Editar'
    fill_in 'Nome:', with: 'Gourmetzinho'
    click_on 'Salvar'

    expect(page).to have_content('Gourmetzinho')
    expect(page).to have_content('Restaurante atualizado com sucesso!')
    expect(page).to have_content('Voltar')
  end
  scenario 'and validates empty fields' do
    create(:restaurant)
    user = create(:user, role: 9)
    login_as(user, scope: :user)

    visit restaurants_path
    click_on 'Gourmetzão'
    click_on 'Editar'
    fill_in 'Nome:', with: ''
    fill_in 'Endereço:', with: ''
    fill_in 'Bairro:', with: ''
    fill_in 'Cidade:', with: ''
    fill_in 'Telefone:', with: ''
    fill_in 'Telefone2:', with: ''
    fill_in 'Custo:', with: ''
    fill_in 'Horários:', with: ''
    fill_in 'Happy hour:', with: ''
    fill_in 'URL do mapa:', with: ''
    select 'Italiana', from: 'Cozinha'
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
