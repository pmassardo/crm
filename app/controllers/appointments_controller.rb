class AppointmentsController < ApplicationController

  def new

    @appointment = Appointment.new
    @contacts = Contact.find(params[:selected_contacts].map(&:to_i))

    @contacts.each { |contact|

      @attendant = Attendant.new
      @attendant.contact_id = contact.id
      @appointment.attendants.push(@attendant)

    }

  end

  def edit

    logger.debug 'parms ' + params.inspect

    @appointment = Appointment.find(params[:id])

    logger.debug '@appointment ' + @appointment.inspect

    # binding.pry

  end

  def update

    # get the account
    @appointment = Appointment.find(params[:id])
    # logger.debug params[:id]

    # update the account
    if @appointment.update_attributes(appointment_params())
      # if it updates
      # return it to the users appointment list
      # render  :edit
      redirect_to edit_appointment_path(@appointment)
    else
      # if it does not update
      # send them back to the edit screen
      render  :edit
    end

  end

  def create

    @appointment = Appointment.new(appointment_params())

    @appointment.user = current_user

    if @appointment.save
      redirect_to appointments_edit_path(id: @appointment.id)
    else
      render  :new
    end

  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_type_id, :user_id, :appointment_date, :start_time, :end_time, :notes, attendants_attributes: [:id, :contact_id, :appointment_id])
  end

end
