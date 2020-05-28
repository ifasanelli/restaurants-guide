require 'rails_helper'

feature 'Superuser set role as visitor' do
  scenario 'successfully' do
    user = create(:user, role: 2, name: 'Italo')
    other_user = create(:user, role: 1, name: 'Mariana', email: 'm@m.com')
    login_as(user, scope: :user)

    visit users_path
    find("#set-visitor-#{other_user.id}").click

    expect(page).to have_content('Italo')
    expect(page).to have_content("Usuário #{other_user.name} NÃO é mais admin!")
  end
end