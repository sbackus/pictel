class Stack < ActiveRecord::Base
  attr_accessible :active, :finished, :max_size

  #relate the cards to the stack
  has_many :cards
end
