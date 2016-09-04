class AccountsController < ApplicationController
  def index

    @accounts = Account.where(user: current_user).order(name: :asc)
    @appointments = Appointment.where(user: current_user).order(appointment_date: :asc).order(start_time: :asc)
    @contacts = Contact.joins(:account).where(' accounts.user_id=' + current_user.id.to_s).order("accounts.name asc").order(last_name: :asc).order(first_name: :asc)

  end

  def new

    @account = Account.new
    @account.contacts.build

  end

  def create

    @account = Account.new(account_params())
    # binding.pry

    @account.user = current_user

    if @account.save
    # @account.contacts.build
      redirect_to edit_account_path(@account)
    else
      render  :new
    end

  end

  def edit

      @account = Account.find(params[:id])

      # @account.contacts.find_by!('active = true')

      @account.contacts.build()

      @account.contacts.each { |contact|

        contact.appointments.build

      }

      # binding.pry

  end

  def update

    # logger.debug params[:selected_contacts]
    # logger.debug params[:schedule_appointment]
    if (params[:schedule_appointment])
      redirect_to new_appointment_path(selected_contacts: params[:selected_contacts],account_id: params[:id])
    else
      # get the account
      @account = Account.find(params[:id])
      # logger.debug params[:id]

      # update the account
      if @account.update_attributes(account_params())
        # if it updates
        # return it to the users accounts list
        # redirect_to accounts_path
        # render  :edit
        redirect_to edit_account_path(@account)
      else
        # if it does not update
        # send them back to the edit screen
        render  :edit
      end

    end

  end

  private

  def account_params
    params.require(:account).permit(:account_type_id, :user_id, :name, :phone, :notes, contacts_attributes: [:id, :account_id, :first_name, :last_name, :phone, :notes, :email])
  end



end
