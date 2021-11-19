class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role:[:student , :admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :book_requests
   has_many :books, through: :book_requests
   ratyrate_rater
end
