class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.integer :card_suit, default: 0, null: false
      t.integer :card_value, default: 0, null: false
      t.integer :position, default: 0, null: false
      t.references :deck, null: false

      t.timestamps
    end
  end
end
