class CreatePokemons < ActiveRecord::Migration[5.2]
    def change
        create_table :pokemons do |t|
            t.string :name
            t.string :type
            t.string :subtype
            t.integer :user_id
        end
    end
end