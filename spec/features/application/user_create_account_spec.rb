require 'rails_helper'

feature 'User create an account' do
  scenario 'successfully' do
    visit root_path
    click_on 'Entrar'
    click_on 'Cadastre-se'

    fill_in 'usr_name', with: 'Maria'
    fill_in 'usr_email', with: 'maria@gmail.com'
    fill_in 'usr_password', with: '123456'
    fill_in 'usr_passwordr', with: '123456'
    click_on 'Cadastrar'

    expect(page).not_to have_content('Entrar')
  end
end
