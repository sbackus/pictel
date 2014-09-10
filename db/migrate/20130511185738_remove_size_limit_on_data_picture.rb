class RemoveSizeLimitOnDataPicture < ActiveRecord::Migration
	change_column :cards, :data_picture, :text, :limit => nil
end
