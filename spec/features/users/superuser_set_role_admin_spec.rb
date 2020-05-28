require 'rails_helper'

feature 'Superuser set role as admin' do
  scenario 'successfully' do
    user = create(:user, role: 2, name: 'Italo')
    other_user = create(:user, role: 0, name: 'Mariana', email: 'm@m.com')
    login_as(user, scope: :user)

    visit users_path
    find("#set-adm-#{other_user.id}").click

    expect(page).to have_content('Italo')
    expect(page).to have_content("Usuário #{other_user.name} agora é admin!")
  end
end