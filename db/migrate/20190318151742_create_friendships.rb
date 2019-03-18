class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :member, foreign_key: true
      t.integer    :friend_id, null: false
      t.integer    :status, null: false, default: 0
      t.timestamps
    end
  end
end
