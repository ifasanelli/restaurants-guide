require 'rails_helper'

feature 'Admin edit a cuisine' do
  scenario 'successfully' do
    create(:cuisine)
    create(:cuisine, name: 'Japonesa')
    create(:cuisine, name: 'Mexicana')
    user = create(:user)
    login_as(user, scope: :user)

    visit cuisines_path
    click_on 'Italiana'
    click_on 'Editar'
    fill_in 'Nome:', with: 'Francesa'
    click_on 'Salvar'

    expect(page).to have_content('Francesa')
    expect(page).to have_content('Cozinha atualizada com sucesso!')
    expect(page).to have_content('Voltar')
  end
  scenario 'and validates empty fields' do
    create(:cuisine)
    user = create(:user)
    login_as(user, scope: :user)

    visit cuisines_path
    click_on 'Italiana'
    click_on 'Editar'
    fill_in 'Nome:', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar')
    expect(page).to have_content('Nome não pode ficar em branco')
  end
end
