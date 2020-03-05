require 'rails_helper'

feature 'Admin register a cuisine' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user, scope: :user)

    visit cuisines_path
    click_on 'Nova cozinha'
    fill_in 'Nome:', with: 'Iraniana'
    click_on 'Salvar'

    expect(page).to have_content('Iraniana')
    expect(page).to have_content('Cozinha criada com sucesso!')
    expect(page).to have_content('Voltar')
  end

  scenario 'validates empty field' do
    user = create(:user)
    login_as(user, scope: :user)

    visit cuisines_path
    click_on 'Nova cozinha'
    fill_in 'Nome:', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar:')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Voltar')
  end
  scenario 'validates duplicateds names' do
    create(:cuisine)
    user = create(:user)
    login_as(user, scope: :user)

    visit cuisines_path
    click_on 'Nova cozinha'
    fill_in 'Nome:', with: 'Italiana'
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar:')
    expect(page).to have_content('Fabricante já existente')
    expect(page).to have_content('Voltar')
  end
end
