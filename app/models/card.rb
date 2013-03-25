class Card < ActiveRecord::Base
  attr_accessible :author, :current
  
  def self.last_card_type
  	order("created_at asc").last.type
  end
  # relates the card to the stack
  belongs_to :stack, counter_cache: true
end

class TextCard < Card
	attr_accessible :data_text
end

class PictureCard < Card
	attr_accessible :data_picture
end