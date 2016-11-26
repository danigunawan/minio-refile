class AddProfileImageToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :profile_image_id, :string
  end
end
