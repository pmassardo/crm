class ContactsController < ApplicationController

  def index
    @contacts = Contact.joins(:account).where(' accounts.user_id=' + current_user.id.to_s)
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
    params.require(:contact).permit(:account_id, :first_name, :last_name, :phone, :notes, :active)
  end

end
