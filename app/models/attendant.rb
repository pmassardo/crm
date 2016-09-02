class Attendant < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :contact
end
