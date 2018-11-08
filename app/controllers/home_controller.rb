class HomeController < ApplicationController

	before_action :selected_currency, only: [:update]

	def index
		Currency.destroy_all
		CurrencyExtract.new.perform
	end

	def show
		@selected_currency = Currency.find(params[:id])
		puts @selected_currency
	end

	def update
	    selected_currency
	    redirect_to quotation_path(@selected_currency.id)
	end

end 

private

	def selected_currency
		if params[:selection][:id] != nil
			@selected_currency = Currency.find(params[:selection][:id])
		else
			@selected_currency = nil
		end
    end	