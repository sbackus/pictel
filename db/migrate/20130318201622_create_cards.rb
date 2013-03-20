class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :author
      t.boolean :current
      t.text :data_text
      t.string :data_picture
      t.string :type
      t.integer :stack_id

      t.timestamps
    end
  end
end
