class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|

      t.timestamps
    end
    add_reference(:followings,:follower,foreign_key: { to_table: :users },index: true)
    add_reference(:followings,:followed,foreign_key: { to_table: :users },index: true)
  end
end
