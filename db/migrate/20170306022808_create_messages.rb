class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :sender_id
      t.integer :receiver_id
      t.timestamps

      t.index :sender_id
      t.index :receiver_id
    end
  end
end
