class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :accounts

  # future relationships
  # has_many :appointments
  # has_many :contacts, through: :accounts, foreign_key: 'user_id'
  # has_many :contacts, through: :appointments, foreign_key: 'user_id'

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

end
