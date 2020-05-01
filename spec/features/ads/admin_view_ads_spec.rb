require 'rails_helper'

feature 'Admin view ads and its details' do
  scenario 'successfully' do
    cuisine = create(:cuisine, name: 'Russa')
    create(:restaurant, name: 'Russo', cuisine: cuisine)
    user = create(:user, role: 2)
    login_as(user, scope: :user)

    visit ads_path
    click_on 'Novo anúncio'
    fill_in 'Nome:', with: 'Campanha-de-carnaval'
    select 'Russo', from: 'Restaurante:'
    attach_file('Imagem', Rails.root.join('spec/fixtures/ads.jpg'))
    click_on 'Salvar'

    expect(page).to have_content('Campanha-de-carnaval')
    expect(page).to have_css('#Campanha-de-carnaval')
    expect(page).to have_content('Voltar')
  end
end
