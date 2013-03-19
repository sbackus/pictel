class Card < ActiveRecord::Base
  attr_accessible :author, :current, :dataPicture, :dataText, :isText

  #relates the card to the stack
  belongs_to :stack
end
