class CardsController < ApplicationController
	helper_method :current_stack
  def index
    @cards = Card.all

    stack_id = current_stack.id

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cards }
    end
  end	

	def new
    @picture_card = current_stack.cards.last

    @stack = Stack.find(params[:stack_id])
		@card = Card.new
	#	@card.stack = @stack

		respond_to do |format|
    	format.html # new.html.erb
    	format.json { render json: @cards }
 	  end
		# TO DO: :author = CURRENT USER
	end

	def create
		#@card = current_stack.new
		@card = TextCard.new
		@card.stack_id = current_stack.id
		
		@card.author = current_player.email
		@card.data_text = params[:card][:data_text]
		if @card.save 
			redirect_to edit_stack_path(current_stack)
		end

    # respond_to do |format|
    #   if @card.save    
    #     format.html show.html.erb #{ redirect_to @cards, notice: 'Stack was successfully created.' }
    #     format.json { render json: @cards, status: :created, location: @card }

    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @cards.errors, status: :unprocessable_entity }
    #   end
    # end		
	end

  def show
    @card = TextCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card }
    end
  end

private 
	def current_stack
		@_current_stack ||= Stack.find(params[:stack_id])
	end	

end
