class Stack < ActiveRecord::Base
  #Set defaults for creating a new stack
  #When a stack is created, it is active
  # attr_accessor_with_default :active, true

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
