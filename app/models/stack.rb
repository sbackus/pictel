class Stack < ActiveRecord::Base
  #Set defaults for creating a new stack
  #When a stack is created, it is active
  # attr_accessor_with_default :active, true

  def self.inactive
    where(active: false)
  end

  def self.unfinished
    where(finished: false)
  end

  

  def self.next_stack
    order("created_at asc").last.type
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
