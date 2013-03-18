class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.boolean :isText
      t.string :author
      t.boolean :current
      t.text :dataText
      t.string :dataPicture

      t.timestamps
    end
  end
end
