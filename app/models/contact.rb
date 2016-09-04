class Contact < ActiveRecord::Base

  default_scope { where("active = true") }
  belongs_to :account, :class_name => Account, :foreign_key => "account_id"

  # name will be account_name
  delegate :name, :to => :account, prefix: true, :allow_nil => true

  has_many :attendants
  has_many :appointments, through: :attendants, autosave: true

  # accepts_nested_attributes_for :appointments, reject_if: :all_blank, allow_destroy: true

  validates :first_name, :last_name, presence: true
  validates :phone, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/}
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :email, uniqueness: true
end
