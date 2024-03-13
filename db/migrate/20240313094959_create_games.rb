class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.references :user
      t.integer :wager
      t.boolean :result

      t.timestamps
    end
  end
end
