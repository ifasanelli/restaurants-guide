require 'rails_helper'

feature 'Admin view data' do
  scenario 'successfully' do
    cuisine = create(:cuisine, name: 'Japonesa')
    restaurant = create(:restaurant, cuisine: cuisine)
    user = create(:user, role: 2, name: 'Italo')
    other_user = create(:user, role: 0, name: 'Mariana', email: 'm@m.com')
    create(:rating, star: 4, restaurant: restaurant, user: user)
    create(:comment, status: 0, restaurant: restaurant, user: user, body: 'Demais!')
    login_as(user, scope: :user)

    visit users_path

    expect(page).to have_content('Italo')
    expect(page).to have_content('Mariana')
    expect(page).to have_content('Gourmetzão')
  end
  scenario 'validate user' do
    user = create(:user, role: 0, name: 'Mariana', email: 'm@m.com')
    login_as(user, scope: :user)

    visit users_path

    expect(page).to have_content('Você não tem permissão para esta página!')
  end
end
