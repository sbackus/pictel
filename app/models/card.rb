class Card < ActiveRecord::Base
  attr_accessible :author, :current, :dataPicture, :dataText, :isText
end
