require 'rails_helper'

feature 'User search for a restaurant' do
  scenario 'successfully' do
    cuisine = create(:cuisine, name: 'Churrascaria')
    create(:restaurant, name: 'Van Gogh', cuisine: cuisine)
    create(:restaurant, name: 'Tertulia', cuisine: cuisine)
    create(:restaurant, name: 'Fogo de chão', cuisine: cuisine)
    create(:restaurant, name: 'Boi bão', cuisine: cuisine)
    create(:restaurant, name: 'Porcão', cuisine: cuisine)
    create(:restaurant, name: 'Mania de churrasco', cuisine: cuisine)

    visit root_path
    fill_in 'Buscar', with: 'churrascaria'
    click_on 'Buscar'

    expect(page).to have_content('Van Gogh')
    expect(page).to have_content('Tertulia')
    expect(page).to have_content('Fogo de chão')
    expect(page).to have_content('Boi bão')
    expect(page).to have_content('Porcão')
    expect(page).to_not have_content('Mania de churrasco')
    expect(page).to have_css('.custom_pagination')
    expect(page).to have_content('Voltar')
  end
end
