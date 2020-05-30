require 'rails_helper'

feature 'Admin changes restaurant status' do
  scenario 'changes to unavailable' do
    create(:restaurant)
    user = create(:user, role: 9)
    login_as(user, scope: :user)

    visit restaurants_path
    click_on 'Gourmetzão'
    click_on 'Editar'
    find('#chck-box').click
    click_on 'Salvar'

    expect(page).to have_content('Inativo')
    expect(page).to have_content('Voltar')
  end
  scenario 'changes to available' do
    create(:restaurant, status: 'unavailable')
    user = create(:user, role: 9)
    login_as(user, scope: :user)

    visit restaurants_path
    click_on 'Gourmetzão'
    click_on 'Editar'
    find('#chck-box').click
    click_on 'Salvar'

    expect(page).to_not have_content('Inativo')
    expect(page).to have_content('Voltar')
  end
end
