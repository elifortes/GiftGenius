class User < ApplicationRecord
  has_one :personnal, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :groups

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
