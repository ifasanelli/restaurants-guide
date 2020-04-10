require 'rails_helper'

describe Restaurant do
  describe '.avg_note' do
    it "should get the restaurant's average rating" do
      user = User.create!(email: "i@i.com", password:'123456', role: "superadmin", name: "Italo Fasanelli")
      cuisine = Cuisine.create!(name:'Italiana')
      restaurant = Restaurant.create!(name: 'Coza Nostra', address: 'Rua Maria Máximo, 59', neighborhood: 'Ponta da Praia', city: 'Santos', status: 0, phone: '13 3327-1331', phone2: '13 3327-1313', cost: 129.99, timmings: 'Seg-Qui 11h às 22h, Sex-Sáb 11h 0h & Dom 11h às 16h', happy_hour: 'Não tem', coffee: true, delivery: true, ac: true, wifi: true, cards: true, tickets: true, outside: true, club: true, vegetarian: true, cuisine_id: cuisine.id, map: "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3645.367049318202!2d-46.30487798531784!3d-23.982812383175045!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce023fbd79cbbb%3A0x65699e571d31437c!2sCondom%C3%ADnio%20Edif%C3%ADcio%20Santa%20Cruz%20-%20Rua%20Maria%20M%C3%A1ximo%2C%2059%20-%20Ponta%20da%20Praia%2C%20Santos%20-%20SP%2C%2011030-100!5e0!3m2!1spt-BR!2sbr!4v1586460553236!5m2!1spt-BR!2sbr")
      #rating = Rating.create!(star: 5, restaurant_id: restaurant.id, user_id: user.id)

      result = restaurant.avg_note

      expect(result).to eq "5.0"
    end
  end
end
