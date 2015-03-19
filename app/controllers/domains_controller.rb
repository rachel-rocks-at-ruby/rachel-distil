class DomainsController < ApplicationController
	require 'socket'

	def index
		@domains = Domain.all
	end

	def new
		@domain = Domain.new
		@account = Account.find(params[:account_id])
	end

	def create
		@domain = Domain.new(params.require(:domain).permit(:hostname, :ip, :account_id))
		@domain.ip = IPSocket::getaddress(@domain.hostname)
		@account = @domain.account
	
      	respond_to do |format|
  			if @domain.save
		      	format.js
  			else
      			format.js
  			end
    	end
	end

	def show
		@domain = Domain.find(params[:id])
	end

	def edit
		@domain = Domain.find(params[:id])
	end

	def update
		@domain = Domain.find(params[:id])
    if @domain.update_attributes(params.require(:domain).permit(:hostname, :ip, :account_id))
       redirect_to account_path(@domain.account)
     else
       flash[:error] = "Error updating domain. Please try again"
       render :edit
     end
	end

	def destroy
		@domain = Domain.find(params[:id])

	    if @domain.destroy
	      flash[:notice] = "Domain was deleted successfully."
	    else
	      flash[:error] = "There was an error deleting the domain."
	    end

	  	respond_to do |format|
	      format.html
	      format.js
	    end
	end
end