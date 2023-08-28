class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :question, null: false
      t.string :choice_1, null: false, limit:50
      t.string :choice_2, null: false, limit:50
      t.string :choice_3, null: false, limit:50
      t.string :choice_4, null: false, limit:50

      t.timestamps
    end
  end
end
