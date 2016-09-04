class Account < ActiveRecord::Base
  belongs_to :account_type, :class_name => AccountType, :foreign_key => "account_type_id"
  delegate :name, :to => :account_type, prefix: true

  belongs_to :user

  has_many :contacts, autosave: true
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true

  has_many :attendants, through: :contacts

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/}

end
