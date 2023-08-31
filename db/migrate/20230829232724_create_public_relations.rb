class CreatePublicRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :public_relations do |t|
      t.integer :user_id, null: false
      t.integer :group_id, null: false
      t.string :title, null: false, limit:50, default:"〇月度理事会議事録"
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
