class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { visitor: 0, admin: 5, superadmin: 9 }
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def admin?
    role == 'admin'
  end

  def superadmin?
    role == 'superadmin'
  end
end
