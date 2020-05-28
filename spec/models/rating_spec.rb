require 'rails_helper'

describe Rating do
  describe '.create' do
    it "should set a rating to the restaurant" do
      post :update_quantity, xhr: true, params: {
        id: cart.id,
        order_id: cart.orders.first.id,
        quantity: 50
      }
    end
  end
end