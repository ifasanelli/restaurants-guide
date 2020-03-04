require 'rails_helper'

feature 'User visit home' do
  scenario 'successfully' do
    visit root_path

    expect(current_path).to eq root_path
  end
end
