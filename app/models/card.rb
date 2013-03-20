class Card < ActiveRecord::Base
  attr_accessible :author, :current
  
  # relates the card to the stack
  belongs_to :stack
end

class TextCard < Card
	attr_accessible :data_text
end

class PictureCard < Card
	attr_accessible :data_picture
end