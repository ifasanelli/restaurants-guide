require 'rails_helper'

feature 'User search for a restaurant' do
  scenario 'successfully' do
    create(:restaurant, name: 'Van Gogh')

    visit root_path
    fill_in 'Buscar', with: 'Van Gogh'
    click_on 'Buscar'

    expect(page).to have_content('Van Gogh')
    expect(page).to have_content('Voltar')
  end
end
