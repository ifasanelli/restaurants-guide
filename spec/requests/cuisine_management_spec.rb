require 'rails_helper'

describe 'Cuisine management' do
  context 'index' do
    it 'renders a json successfully' do
      cuisine = create(:cuisine)
      other_cuisine = create(:cuisine, name: 'Japonesa')
      another_cuisine = create(:cuisine, name: 'Mexicana')

      get api_v1_cuisines_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[0][:name]).to eq(cuisine.name)
      expect(json[1][:name]).to eq(other_cuisine.name)
      expect(json[2][:name]).to eq(another_cuisine.name)
    end
  end
end
