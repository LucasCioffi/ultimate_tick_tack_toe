class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.text :board, array: true, default: []
      t.string :winner
      t.string :turn
      t.text :valid_subgames, array: true, default: []

      t.timestamps
    end
  end
end
