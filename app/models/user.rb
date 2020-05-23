class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { visitor: 0, admin: 1, superadmin: 2 }
  has_many :comments
  has_many :ratings

  def admin?
    role == 'admin'
  end

  def superadmin?
    role == 'superadmin'
  end
end
