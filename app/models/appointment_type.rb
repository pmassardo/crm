class AppointmentType < ActiveRecord::Base
  # has_many :appointments

  # validation if a interface is built
  validates :name, uniqueness: true
  validates :name,  presence: true
end
