require 'rails_helper'

feature 'User view ratings' do
  scenario 'successfully' do
    cuisine = create(:cuisine, name: 'Japonesa')
    restaurant = create(:restaurant, cuisine: cuisine)
    user = create(:user, role: 2)
    create(:rating, star: 4, restaurant: restaurant, user: user)
    login_as(user, scope: :user)

    visit restaurant_path(restaurant)

    expect(page).to have_content('4.0')
  end
end
