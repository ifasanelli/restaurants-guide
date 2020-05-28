require 'rails_helper'

feature 'User rate a restaurant' do
  scenario 'successfully' do
    cuisine = create(:cuisine, name: 'Japonesa')
    restaurant = create(:restaurant, cuisine: cuisine)
    user = create(:user, role: 0)
    login_as(user, scope: :user)

    visit restaurant_path(restaurant)
    find("#restaurant_#{restaurant.id}_rating_4").click

    expect(page).to have_content('Obrigado pelo seu voto!')
  end
end
