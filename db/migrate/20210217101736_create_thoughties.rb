class CreateThoughties < ActiveRecord::Migration[6.1]
  def change
    create_table :thoughties do |t|
      t.text :content

      t.timestamps
    end
    add_reference(:thoughties,:author,foreign_key: { to_table: :users })
  end
end
