require 'rails_helper'

feature 'Admin create an ad' do
  scenario 'successfully' do
    cuisine = create(:cuisine, name: 'Russa')
    create(:restaurant, name: 'Russo', cuisine: cuisine)
    user = create(:user)
    login_as(user, scope: :user)

    visit ads_path
    click_on 'Novo anúncio'
    fill_in 'Nome:', with: 'Campanha de carnaval'
    select 'Russo', from: 'Restaurante:'
    click_on 'Salvar'

    expect(page).to have_content('Campanha de carnaval')
    expect(page).to have_content('Voltar')
  end
end
