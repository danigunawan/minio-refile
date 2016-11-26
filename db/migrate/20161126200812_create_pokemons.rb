class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :hp
      t.integer :attack
      t.integer :defense

      t.timestamps null: false
    end
  end
end
