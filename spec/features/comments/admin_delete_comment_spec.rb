require 'rails_helper'

feature 'Admin delete a comment' do
  scenario 'successfully' do
    user = create(:user, role: 1)
    create(:comment, status: 0, user: user, body: 'Muito bom restaurante!')
    login_as(user, scope: :user)

    visit restaurants_path
    click_on 'Gourmetzão'
    find('#del-comment').click

    expect(page).not_to have_content('Muito bom restaurante!')
    expect(page).to have_content('Gourmetzão')
  end
end