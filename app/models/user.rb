class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :gossips, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage", dependent: :destroy
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage", dependent: :destroy
  has_many :comments, dependent: :destroy
  #validates :first_name,
   # presence: true,
   # length: { minimum: 3 }
  #validates :last_name,
   # presence: true,
   # length: { minimum: 3 }
  #validates :description,
   # presence: true,
   # length: { minimum: 3 }
  #validates :email,
   # uniqueness: true,
   # presence: true,
   # format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  #validates :age,
    #presence: true,
    #numericality: { greater_than: 0 }
  validates :password, presence: true, length: { minimum: 6 }
end
