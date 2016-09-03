class AppointmentsController < ApplicationController

  def new

    logger.debug params[:selected_contacts]

    @appointment = Appointment.new
    @contacts = Contact.find(params[:selected_contacts].map(&:to_i))

    count = 0

    # @appointment.attendants.build

    @contacts.each { |contact|

      #

      @attendant = Attendant.new
      @attendant.contact_id = contact.id
      @appointment.attendants.push(@attendant)
      count = count +1

    }

    # binding.pry

    logger.debug @contacts.inspect

  end

  def edit


    # binding.pry

    @appointment = Appointment.find(params[:format])

  end

  def create


    @appointment = Appointment.new(appointment_params())
    # binding.pry

    @appointment.user = current_user

    if @appointment.save
      redirect_to appointments_edit_path(@appointment)
    else
      render  :new
    end

  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_type_id, :user_id, :appointment_date, :start_time, :end_time, :notes, attendants_attributes: [:id, :contact_id, :appointment_id])
  end


end
