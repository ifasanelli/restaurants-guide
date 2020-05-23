require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.admin?' do
    context 'user has role set as admin' do
      let!(:user) { build(:user, role: 'admin') }

      it 'returns true' do
        expect(user).to be_admin
      end
    end

    context 'user has role set as non admin' do
      let!(:user) { build(:user, role: 'visitor') }

      it 'returns true' do
        expect(user).not_to be_admin
      end
    end
  end
end