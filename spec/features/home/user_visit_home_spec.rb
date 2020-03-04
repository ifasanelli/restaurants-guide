require 'rails_helper'

feature 'User visit home' do
  scenario 'successfully' do
    visit root_path

    expect(current_path).to eq root_path
    expect(page).to have_content('Home')
    expect(page).to have_content('Contato')
    expect(page).to have_content('Quem Somos')
  end
end
