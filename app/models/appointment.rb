class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :appointment_type, :class_name => AppointmentType, :foreign_key => "appointment_type_id"

  # name will be appointment_type_name
  delegate :name, :to => :appointment_type, prefix: true

  has_many :attendants, autosave: true
  accepts_nested_attributes_for :attendants, reject_if: :all_blank, allow_destroy: true

  has_many :contacts, through: :attendants

  validate :is_valid_date?
  validates :end_time, :numericality => {:greater_than_or_equal_to => :start_time, :message => " must be greater than start time!"  }

  TIMES = { 1.00 => "1:00 AM", 1.25 => "1:15 AM", 1.50 => "1:30 AM", 1.75 => "1:45 AM",
            2.00 => "2:00 AM", 2.25 => "2:15 AM", 2.50 => "2:30 AM", 2.75 => "2:45 AM",
            3.00 => "3:00 AM", 3.25 => "3:15 AM", 3.50 => "3:30 AM", 3.75 => "3:45 AM",
            4.00 => "4:00 AM", 4.25 => "4:15 AM", 4.50 => "4:30 AM", 4.75 => "4:45 AM",
            5.00 => "5:00 AM", 5.25 => "5:15 AM", 5.50 => "5:30 AM", 5.75 => "5:45 AM",
            6.00 => "6:00 AM", 6.25 => "6:15 AM", 6.50 => "6:30 AM", 6.75 => "6:45 AM",
            7.00 => "7:00 AM", 7.25 => "7:15 AM", 7.50 => "7:30 AM", 7.75 => "7:45 AM",
            8.00 => "8:00 AM", 8.25 => "8:15 AM", 8.50 => "8:30 AM", 8.75 => "8:45 AM",
            9.00 => "9:00 AM", 9.25 => "9:15 AM", 9.50 => "9:30 AM", 9.75 => "9:45 AM",
            10.00 => "10:00 AM", 10.25 => "10:15 AM", 10.50 => "10:30 AM", 10.75 => "10:45 AM",
            11.00 => "11:00 AM", 11.25 => "11:15 AM", 11.50 => "11:30 AM", 11.75 => "11:45 AM",
            12.00 => "12:00 PM", 12.25 => "12:15 PM", 12.50 => "12:30 PM", 12.75 => "12:45 PM",
            13.00 => "1:00 PM", 13.25 => "1:15 PM", 13.50 => "1:30 PM", 13.75 => "1:45 PM",
            14.00 => "2:00 PM", 14.25 => "2:15 PM", 14.50 => "2:30 PM", 14.75 => "2:45 PM",
            15.00 => "3:00 PM", 15.25 => "3:15 PM", 15.50 => "3:30 PM", 15.75 => "3:45 PM",
            16.00 => "4:00 PM", 16.25 => "4:15 PM", 16.50 => "4:30 PM", 16.75 => "4:45 PM",
            17.00 => "5:00 PM", 17.25 => "5:15 PM", 17.50 => "5:30 PM", 17.75 => "5:45 PM",
            18.00 => "6:00 PM", 18.25 => "6:15 PM", 18.50 => "6:30 PM", 18.75 => "6:45 PM",
            19.00 => "7:00 PM", 19.25 => "7:15 PM", 19.50 => "7:30 PM", 19.75 => "7:45 PM",
            20.00 => "8:00 PM", 20.25 => "8:15 PM", 20.50 => "8:30 PM", 20.75 => "8:45 PM",
            21.00 => "9:00 PM", 21.25 => "9:15 PM", 21.50 => "9:30 PM", 21.75 => "9:45 PM",
            22.00 => "10:00 PM", 22.25 => "10:15 PM", 22.50 => "10:30 PM", 22.75 => "10:45 PM",
            23.00 => "11:00 PM", 23.25 => "11:15 PM", 23.50 => "11:30 PM", 23.75 => "11:45 PM",
            0.00 => "12:00 AM", 0.25 => "12:15 AM", 0.50 => "12:30 AM", 0.75 => "12:45 AM"}

  def self.times

    return TIMES

  end

  # validate that the date is a valid date
  def is_valid_date?
   if(!(appointment_date.is_a?(Date)))
     errors.add(:appointment_date, 'Sorry, Invalid Date of Birth Entered.')
   end
  end

end
