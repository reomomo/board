class CreateMajorItems < ActiveRecord::Migration[6.1]
  def change
    create_table :major_items do |t|
      t.integer :public_relation_id, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
