class AddCardCounterCache < ActiveRecord::Migration
  def change

  	add_column :stacks, :cards_count, :integer, :default => 0

  end
end
