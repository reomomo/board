class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.integer :public_relation_id
      t.integer :category_id
      t.string :name, null: false, limit:50
      t.string :body, null: false, limit:500

      t.timestamps
    end
  end
end
