class Attendant < ActiveRecord::Base
  belongs_to :appointment , :class_name => Appointment, :foreign_key => "appointment_id"
  belongs_to :contact, :class_name => Contact, :foreign_key => "contact_id"

  # allow access to the contact data
  # and prefix it with the model name
  # so first_name will be contact_first_name
  # phone will be contact_phone
  delegate :first_name, :to => :contact, :prefix => true
  delegate :last_name, :to => :contact, :prefix => true
  delegate :phone, :to => :contact, :prefix => true
  delegate :email, :to => :contact, :prefix => true
  delegate :notes, :to => :contact, :prefix => true
  delegate :id, :to => :contact, :prefix => true
  delegate :account_id, :to => :contact, :prefix => true

end
