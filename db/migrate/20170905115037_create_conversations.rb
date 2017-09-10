class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer     :recipient_id
      t.integer     :sender_id
      t.text        :message
      t.timestamps
    end
    add_index :conversations, :recipient_id
    add_index :conversations, :sender_id
    # 팔로우 할때 적용
    # add_index :conversations, [:recipient_id, :sender_id], unique: true
  end
end
