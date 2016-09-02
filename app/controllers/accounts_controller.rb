class AccountsController < ApplicationController
  def index
    @accounts = Account.where(user: current_user)
  #  @contacts = Account.where(user: current_user)
  end

  def new
    @account = Account.new
    @account.contacts.build
    # binding.pry
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

      @account.contacts.build()

  end

  def update

    # get the account
    @account = Account.find(params[:id])

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

  def destroy
  end

  private

  def account_params
    params.require(:account).permit(:account_type_id, :user_id, :name, :phone, :notes, contacts_attributes: [:id, :account_id, :first_name, :last_name, :phone, :notes, :email])
  end



end
