class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.text :context
      t.boolean :opened
      t.datetime :send_date

      t.timestamps
    end
  end
end
