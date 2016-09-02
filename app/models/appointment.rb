class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :appointment_type, :class_name => AppointmentType, :foreign_key => "appointment_type_id"

  # name will be appointment_type_name
  delegate :name, :to => :appointment_type, prefix: true

  has_many :attendants

end
