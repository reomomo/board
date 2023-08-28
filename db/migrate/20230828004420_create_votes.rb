class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.string :title, null: false
      t.string :question, null: false
      t.string :choice, null: false, limit:50
      t.string :answer, null: false

      t.timestamps
    end
  end
end
