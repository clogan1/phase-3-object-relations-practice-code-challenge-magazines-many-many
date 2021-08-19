class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :reader, foreign_key: true
      t.belongs_to :magazine, foreign_key: true
      t.integer :price
    end
  end
end
