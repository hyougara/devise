class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable ,
          :lockable, :timeoutable, :trackable

  has_many :posts ,dependent: :destroy
end
# ,:omniauthable, omniauth_providers: [:twitter]
# :confirmable, 