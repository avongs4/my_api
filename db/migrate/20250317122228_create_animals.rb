# class CreateAnimals < ActiveRecord::Migration[8.0]
#   def change
#     create_table :animals do |t|
#       t.timestamps
#     end
#   end
# end

class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :sex
      t.float :length
      t.float :diameter
      t.float :height
      t.float :whole_weight
      t.float :shucked_weight
      t.float :viscera_weight
      t.float :shell_weight
      t.integer :rings

      t.timestamps
    end
  end
end
