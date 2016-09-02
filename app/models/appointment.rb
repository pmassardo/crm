class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :appointment_type
  has_many :attendants
end
