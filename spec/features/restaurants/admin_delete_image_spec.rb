require 'rails_helper'

feature 'Admin delete image' do
  scenario 'successfully' do
    create(:restaurant)
    user = create(:user, role: 9)
    login_as(user, scope: :user)

    visit restaurants_path
    click_on 'Gourmetzão'
    click_on 'Editar'
    attach_file('Fotos:', Rails.root.join('spec/fixtures/ads.jpg'))
    click_on 'Salvar'
    find('#del-0').click

    expect(page).not_to have_css('#del-0')
    expect(page).to have_content('Voltar')
  end
end