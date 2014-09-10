class Stack < ActiveRecord::Base
  #Set defaults for creating a new stack
  #When a stack is created, it is active
  # attr_accessor_with_default :active, true


  def self.inactive
    # TO DO: CHANGE THIS TO FALSE
    where(active: false)
  end

  def self.unfinished
    where(finished: false)
  end

  def self.sort_card_count
    order("cards_count DESC")
  end

  def self.not_empty
    where("cards_count != '0'")
  end

  def self.not_user(email) 
    where("cards.author != 'email'")
  end

  def self.next_stack(email)

    inactive.unfinished.not_empty.sort_card_count.each do |stack|
      if stack.cards.last.author != email
        return stack
      end
    end
    return nil
  end

  #A stack starts off unfinished
  attr_accessible :finished

  attr_accessible :max_size

  attr_accessible :active
  def set_default_attributes
  	self.finished = false
  	self.active = true
  	self.max_size = 5
  end
  #relate the cards to the stack
  has_many :cards
end
