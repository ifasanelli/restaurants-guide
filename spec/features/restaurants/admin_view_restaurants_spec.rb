require 'rails_helper'

feature 'Admin view restaurants' do
  scenario 'successfully' do
    create(:restaurant)
    user = create(:user)
    login_as(user, scope: :user)

    visit restaurants_path

    expect(page).to have_content('Gourmetzão')
    expect(page).to have_content('Voltar')
  end

  scenario 'and view restaurant details' do
    create(:restaurant)
    user = create(:user)
    login_as(user, scope: :user)

    visit restaurants_path

    click_on 'Gourmetzão'

    expect(page).to have_content('Gourmetzão')
    expect(page).to have_content('Rua de Santos, 13')
    expect(page).to have_content('Voltar')
  end
end
