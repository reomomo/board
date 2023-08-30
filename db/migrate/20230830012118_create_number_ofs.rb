class CreateNumberOfs < ActiveRecord::Migration[6.1]
  def change
    create_table :number_ofs do |t|
      t.integer :number_of, null: false

      t.timestamps
    end
  end
end
