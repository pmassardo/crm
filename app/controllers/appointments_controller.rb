class AppointmentsController < ApplicationController


  def new

    logger.debug 'TEST CODE parms ' + params.inspect

    if (params[:selected_contacts]!=nil)

      @appointment = Appointment.new
      @contacts = Contact.find(params[:selected_contacts].map(&:to_i))

      @contacts.each { |contact|

        @attendant = Attendant.new
        @attendant.contact_id = contact.id
        @appointment.attendants.push(@attendant)

      }
    else
      # if it is coming from the account index page
      if(params[:schedule_appointment]!=nil)
        # send it back there
        redirect_to accounts_path, notice: 'Please select at least one contact to make an appointment.'
      else
        # it is coming from the account page
        redirect_to edit_account_path(id: params[:account_id]), notice: 'Please select at least one contact to make an appointment.'
      end
    end

  end

  def edit

    logger.debug 'TEST CODE parms ' + params.inspect

    @appointment = Appointment.find(params[:id])

    # binding.pry
    @appointment.attendants.build
    # binding.pry
    logger.debug 'TEST CODE @appointment ' + @appointment.inspect

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
      redirect_to edit_appointment_path(id: @appointment.id)
    else
      render  :new
    end

  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_type_id, :user_id, :appointment_date, :start_time, :end_time, :notes, attendants_attributes: [:id, :contact_id, :appointment_id])
  end

end
