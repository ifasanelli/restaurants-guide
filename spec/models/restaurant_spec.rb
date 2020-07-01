require 'rails_helper'

describe Restaurant do
  describe '.avg_note' do
    it "should get the restaurant's average rating" do
      user = create(:user)
      restaurant = create(:restaurant)
      Rating.create!(star: 5, restaurant_id: restaurant.id, user_id: user.id)

      result = restaurant.avg_note

      expect(result).to eq '5.0'
    end
  end
end
