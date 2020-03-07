require 'rails_helper'

feature 'Admin view ads and its details' do
  scenario 'successfully' do
    cuisine = create(:cuisine, name: 'Russa')
    restaurant = create(:restaurant, cuisine: cuisine)
    create(:ad, restaurant: restaurant)
    create(:ad, restaurant: restaurant, name: 'Campanha de carnaval')
    create(:ad, restaurant: restaurant, name: 'Campanha de páscoa')
    user = create(:user)
    login_as(user, scope: :user)

    visit ads_path
    click_on 'Campanha de natal'

    expect(page).to have_content('Campanha de natal')
    expect(page).to_not have_content('Campanha de carnaval')
    expect(page).to_not have_content('Campanha de páscoa')
    expect(page).to have_content('Voltar')
  end
end
