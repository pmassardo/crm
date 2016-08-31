class Account < ActiveRecord::Base
  belongs_to :account_type
  belongs_to :user

  # future relationships
  # has_many :contacts
  # has_many :appointments, through: :contacts, foreign_key: 'account_id'

end
