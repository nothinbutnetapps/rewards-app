class CreateRedemptions < ActiveRecord::Migration[7.1]
  def change
    create_table :redemptions do |t|
      t.belongs_to :user, null: false
      t.belongs_to :reward, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
