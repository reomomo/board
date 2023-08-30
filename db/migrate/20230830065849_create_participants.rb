class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.integer :public_relation_id
      t.string :name, null: false, limit:50
      t.boolean :is_participated, null: false, default: "FALSE"

      t.timestamps
    end
  end
end
