class SeedAnimals < ActiveRecord::Migration[8.0]
  def up
    Animal.create(name: "Lion", age: 5, species: "Panthera leo")
    Animal.create(name: "Elephant", age: 10, species: "Loxodonta")
  end

  def down
    Animal.delete_all
  end
end

