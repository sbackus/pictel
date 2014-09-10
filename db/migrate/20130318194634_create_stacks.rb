class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.boolean :finished
      t.integer :max_size
      t.boolean :active

      t.timestamps
    end
  end
end
