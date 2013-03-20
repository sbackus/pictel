class CardsController < ApplicationController

	def new
		@stack = Stack.find(params[:stack_id])
		@card = Card.new
		@card.stack = @stack

		respond_to do |format|
    	format.html # new.html.erb
    	format.json { render json: @stack }
 	  end
		# TO DO: :author = CURRENT USER
	end

end
