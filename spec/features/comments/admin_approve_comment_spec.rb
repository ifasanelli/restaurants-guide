require 'rails_helper'

feature 'Admin approve a comment' do
  scenario 'successfully' do
    user = create(:user, role: 5)
    create(:comment, status: 0, user: user, body: 'Muito bom restaurante!')
    login_as(user, scope: :user)

    visit restaurants_path
    click_on 'Gourmetzão'
    find('#approve-comment').click

    expect(page).to have_content('Muito bom restaurante!')
    expect(page).not_to have_css('#del-comment')
    expect(page).not_to have_css('#approve-comment')
    expect(page).to have_content('Gourmetzão')
  end
end