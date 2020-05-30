require 'rails_helper'

feature 'Admin view cuisines' do
  scenario 'successfully' do
    create(:cuisine)
    create(:cuisine, name: 'Japonesa')
    create(:cuisine, name: 'Mexicana')
    user = create(:user, role: 9)
    login_as(user, scope: :user)

    visit cuisines_path

    expect(page).to have_content('Italiana')
    expect(page).to have_content('Japonesa')
    expect(page).to have_content('Mexicana')
    expect(page).to have_content('Voltar')
  end

  scenario 'and view cuisine details' do
    create(:cuisine)
    create(:cuisine, name: 'Japonesa')
    create(:cuisine, name: 'Mexicana')
    user = create(:user, role: 9)
    login_as(user, scope: :user)

    visit cuisines_path

    click_on 'Italiana'

    expect(page).to have_content('Italiana')
    expect(page).to have_content('Voltar')
  end

  scenario 'validates visitor' do
    create(:cuisine)
    create(:cuisine, name: 'Japonesa')
    create(:cuisine, name: 'Mexicana')
    user = create(:user, role: 0)
    login_as(user, scope: :user)

    visit cuisines_path

    expect(page).not_to have_content('Italiana')
    expect(page).not_to have_content('Japonesa')
    expect(page).not_to have_content('Mexicana')
    expect(current_path).to eq root_path
  end
end
