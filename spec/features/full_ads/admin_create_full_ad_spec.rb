require 'rails_helper'

feature 'Admin create full ad' do
  scenario 'successfully' do
    cuisine = create(:cuisine, name: 'Russa')
    create(:restaurant, name: 'Russo', cuisine: cuisine)
    user = create(:user, role: 9)
    login_as(user, scope: :user)

    visit full_ads_path
    click_on 'Novo anúncio'
    fill_in 'Nome:', with: 'Campanha-home'
    select 'Russo', from: 'Restaurante:'
    attach_file('Imagem', Rails.root.join('spec/fixtures/ads.jpg'))
    click_on 'Salvar'

    expect(page).to have_content('Campanha-home')
    expect(page).to have_content('Voltar')
  end

  scenario 'validate empty fields' do
    cuisine = create(:cuisine, name: 'Russa')
    create(:restaurant, name: 'Russo', cuisine: cuisine)
    user = create(:user, role: 9)
    login_as(user, scope: :user)

    visit full_ads_path
    click_on 'Novo anúncio'
    fill_in 'Nome:', with: ''
    select 'Russo', from: 'Restaurante:'
    attach_file('Imagem', Rails.root.join('spec/fixtures/ads.jpg'))
    click_on 'Salvar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Você deve corrigir os erros para continuar:')
    expect(page).to have_content('Voltar')
  end

  scenario 'prevent users to access full ads pages' do
    cuisine = create(:cuisine, name: 'Russa')
    create(:restaurant, name: 'Russo', cuisine: cuisine)
    user = create(:user, role: 0)
    login_as(user, scope: :user)

    visit full_ads_path

    expect(current_path).to eq root_path
  end
end
