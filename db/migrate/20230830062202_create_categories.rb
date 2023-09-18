class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false, limit:50
      t.integer :group_id, null: false

      t.timestamps
    end
  end
end
