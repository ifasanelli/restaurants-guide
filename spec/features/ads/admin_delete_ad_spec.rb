require 'rails_helper'

feature 'Admin delete an ad' do
  scenario 'successfully' do
    cuisine = create(:cuisine, name: 'Russa')
    create(:restaurant, name: 'Russo', cuisine: cuisine)
    user = create(:user)
    login_as(user, scope: :user)

    visit ads_path
    click_on 'Novo anúncio'
    fill_in 'Nome:', with: 'Campanha-de-carnaval'
    select 'Russo', from: 'Restaurante:'
    attach_file('Imagem', Rails.root.join('spec/fixtures/ads.jpg'))
    click_on 'Salvar'
    click_on 'Deletar'

    expect(page).to_not have_content('Campanha-de-natal')
    expect(page).to have_content('Voltar')
  end
end
