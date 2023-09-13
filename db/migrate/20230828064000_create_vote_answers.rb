class CreateVoteAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :vote_answers do |t|
      t.integer "user_id", null: false
      t.integer "vote_id", null: false
      t.string :answer, null: false

      t.timestamps
    end
  end
end
