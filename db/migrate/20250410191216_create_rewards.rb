class CreateRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :rewards do |t|
      t.string :name, null: false
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
