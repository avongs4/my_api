class SeedAnimals < ActiveRecord::Migration[8.0]
  def up
    Animal.create!(
      sex: "M",
      length: 0.35,
      diameter: 0.265,
      height: 0.09,
      whole_weight: 0.2255,
      shucked_weight: 0.0995,
      viscera_weight: 0.0485,
      shell_weight: 0.07,
      rings: 7
    )

    Animal.create!(
      sex: "F",
      length: 0.42,
      diameter: 0.315,
      height: 0.12,
      whole_weight: 0.3515,
      shucked_weight: 0.1415,
      viscera_weight: 0.0645,
      shell_weight: 0.096,
      rings: 10
    )
  end

  def down
    Animal.delete_all
  end
end

