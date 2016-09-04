class AccountType < ActiveRecord::Base
  has_many :accounts

  #accepts_nested_attributes_for

  # validation if a interface is built
  validates :name, uniqueness: true
  validates :name,  presence: true
end
