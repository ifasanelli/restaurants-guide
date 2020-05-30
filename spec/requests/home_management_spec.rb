require 'rails_helper'

describe 'Home management' do
  context 'search' do
    it 'renders a json successfully' do
      cuisine = create(:cuisine, name: 'Churrascaria' )
      restaurant = create(:restaurant, name: 'Van Gogh')
      other_restaurant = create(:restaurant, name: 'Tertulia', cuisine: cuisine)

      get api_v1_search_path, params: { q: 'van' }
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[0][:name]).to eq('Van Gogh')
      expect(json.length).to eq(1)
    end
  end
end