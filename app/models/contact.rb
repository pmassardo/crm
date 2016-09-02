class Contact < ActiveRecord::Base
  belongs_to :account

  # has_many :appointments, autosave: true

  # accepts_nested_attributes_for :appointments, reject_if: :all_blank, allow_destroy: true

  validates :first_name, :last_name, presence: true

  validates :phone, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/}
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :email, uniqueness: true
end
