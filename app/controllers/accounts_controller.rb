class AccountsController < ApplicationController
  def index
    @accounts = Account.where(user: current_user)
  end

  def new
    @account = Account.new
  end

  def create

    @account = Account.new(account_params())

    @account.user = current_user

    if @account.save
      redirect_to accounts_path
    else
      render  :new
    end

  end

  def edit
      @account = Account.find(params[:id])
  end

  def update

    # get the account
    @account = Account.find(params[:id])

    # update the account
    if @account.update_attributes(account_params())
      # if it updates
      # return it to the users accounts list
      redirect_to accounts_path
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
    params.require(:account).permit(:account_type_id, :user_id, :name, :phone, :notes)
  end


end
