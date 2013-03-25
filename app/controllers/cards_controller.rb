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

	def create
		@card = Card.new(params[:stack])

    respond_to do |format|
      if @card.save    
        format.html { redirect_to @card, notice: 'Stack was successfully created.' }

        format.json { render json: @card, status: :created, location: @card }
        
      else
        format.html { render action: "new" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end		
	end

end
