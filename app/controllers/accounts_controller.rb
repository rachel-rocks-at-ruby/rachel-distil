class AccountsController < ApplicationController
	def index
		@accounts = Account.all
	end

	def new
		@account = Account.new
	end

	def create
		@account = Account.new(params.require(:account).permit(:name))

		if @account.save
      redirect_to account_path(@account), notice: "Account was created successfully."
    else
      flash[:error] = "Error creating account. Please try again."
      render :new
    end
	end

	def show
    @accounts = Account.where()
		@account = Account.find(params[:id])
    @domains = Domain.where(account_id: @account.id)
	end

	def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params.require(:account).permit(:name))
       redirect_to @account
     else
       flash[:error] = "Error updating account. Please try again"
       render :edit
     end
  end

	def destroy
		@account = Account.find(params[:id])

    if @account.destroy
      flash[:notice] = "Account was deleted successfully."
      redirect_to accounts_path
    else
      flash[:error] = "There was an error deleting the account."
      redirect_to :back
    end
	end
end
