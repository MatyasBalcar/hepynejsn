class CreateDecks < ActiveRecord::Migration[7.1]
  def change
    create_table :decks do |t|
      t.references :game, null: false
      t.integer :current_card, default: 0, null: false

      t.timestamps
    end
  end
end
