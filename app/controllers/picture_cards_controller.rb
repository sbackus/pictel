class PictureCardsController < ApplicationController

def new
		@stack = Stack.find(params[:stack_id])
		@text_card = @stack.cards.last
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
		
		@card.author = current_player.email
		@card.data_picture = params[:picture_card][:data_picture]

		if @card.save 
			redirect_to edit_stack_path(current_stack)
		end
	
	end

private 
	def current_stack
		@_current_stack ||= Stack.find(params[:stack_id])
	end	

end
