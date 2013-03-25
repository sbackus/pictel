class PictureCardsController < ApplicationController

def new
		@stack = Stack.find(params[:stack_id])
		@card = PictureCard.new

		respond_to do |format|
    	format.html # new.html.erb
    	format.json { render json: @cards }
 	  end
		# TO DO: :author = CURRENT USER
	end

	def create
		#@card = current_stack.new
		@card = PictureCard.new
		@card.stack_id = current_stack.id
		
		@card.author = params[:picture_card][:author]
		@card.data_picture = params[:picture_card][:data_picture]


    respond_to do |format|
      if @card.save    
        format.html show.html.erb #{ redirect_to @cards, notice: 'Stack was successfully created.' }
        format.json { render json: @cards, status: :created, location: @card }

      else
        format.html { render action: "new" }
        format.json { render json: @cards.errors, status: :unprocessable_entity }
      end
    end		
	end

private 
	def current_stack
		@_current_stack ||= Stack.find(params[:stack_id])
	end	

end
