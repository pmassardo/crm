class ContactsController < ApplicationController
  def destroy
    @account = Account.find(params[:account_id])
    @contact = @account.contacts.find(params[:id])
    if @contact.destroy
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
