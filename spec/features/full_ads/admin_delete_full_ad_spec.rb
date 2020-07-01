require 'rails_helper'

feature 'Admin delete full ad' do
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
    click_on 'Deletar'

    expect(page).not_to have_content('Campanha-home')
  end
end
