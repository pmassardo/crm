class ContactsController < ApplicationController

  def index
    @contacts = Contact.joins(:account).where(' accounts.user_id=' + current_user.id.to_s)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params())

    if @contact.save
      redirect_to edit_contact_path(id: @contact.id)
    else
      render  :new
    end

  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update

    logger.debug "HEEREEEEEE ----- "  + params.inspect
    @contact = Contact.find(params[:id])

    # update the account
    if @contact.update_attributes(contact_params())
      # if it updates
      # return it to the users appointment list
      # render  :edit
      redirect_to edit_contact_path(@contact)
    else
      # if it does not update
      # send them back to the edit screen
      render  :edit
    end

  end

  def destroy

    @account = Account.find(params[:account_id])
    @contact = Contact.find(params[:id])

    @contact.active = false

    if @contact.save
      redirect_to edit_account_path(@account)
    else
      redirect_to edit_account_path(@account)
    end
  end

private

  def contact_params
    params.require(:contact).permit(:account_id, :first_name, :last_name, :phone, :email, :notes, :active)
  end

end
