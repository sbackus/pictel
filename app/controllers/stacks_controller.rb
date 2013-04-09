class StacksController < ApplicationController

  before_filter :authenticate_player!
  # GET /stacks
  # GET /stacks.json
  def index
    @stacks = Stack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stacks }
    end
  end

  # GET /stacks/1
  # GET /stacks/1.json
  def show
    @stack = Stack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stack }
    end
  end

  # GET /stacks/new
  # GET /stacks/new.json
  def new
    @stack = Stack.new
    @stack.set_default_attributes
    # TO DO - DON'T HAVE IT CREATE A NEW THING IN A DATABASE, YET
    @stack.save
    @card = Card.new
    @card.type = "TextCard"
    @card.stack_id = @stack.id
    #redirect to create a new card
    # redirect_to new_stack_card_path(@stack)


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cards }
    end

  end

  # GET /stacks/1/edit
  def edit
    @stack = Stack.next_stack
    if @stack.cards.last_card_type == "TextCard"
      redirect_to new_stack_picture_card_path(@stack)
    else
      redirect_to new_stack_card_path(@stack)    
    end  


    # Below code allows to edit the stack
    # @stack = Stack.find(params[:id])

  end

  # POST /stacks
  # POST /stacks.json
  def create
    


    @card.author = params[:card][:author]
    @card.data_text = params[:card][:data_text]
    if @card.save 
      redirect_to edit_stack_path(current_stack)
    end
    # respond_to do |format|
    #   if @stack.save
    #     format.html { redirect_to @stack, notice: 'Stack was successfully created.' }
    #     format.json { render json: @stack, status: :created, location: @stack }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @stack.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /stacks/1
  # PUT /stacks/1.json
  def update
    @stack = Stack.find(params[:id])

    respond_to do |format|
      if @stack.update_attributes(params[:stack])
        format.html { redirect_to @stack, notice: 'Stack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stacks/1
  # DELETE /stacks/1.json
  def destroy
    @stack = Stack.find(params[:id])
    @stack.destroy

    respond_to do |format|
      format.html { redirect_to stacks_url }
      format.json { head :no_content }
    end
  end
end

