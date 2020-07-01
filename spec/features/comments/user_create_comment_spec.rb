require 'rails_helper'

feature 'User create a comment' do
  scenario 'successfully' do
    create(:restaurant)
    user = create(:user, role: 9)
    login_as(user, scope: :user)

    visit restaurants_path
    click_on 'Gourmetzão'
    fill_in 'form-imput', with: 'Muito bom restaurante!'
    click_on 'Enviar'

    expect(page).to have_content('Muito bom restaurante!')
    expect(page).to have_css('#del-comment')
    expect(page).to have_css('#approve-comment')
  end
end
