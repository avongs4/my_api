require 'csv'

# Path to the dataset file
file_path = Rails.root.join('db', 'seeds', 'abalone.data')

# Read and import data
CSV.foreach(file_path, headers: false) do |row|
  Animal.create!(
    sex: row[0],
    length: row[1],
    diameter: row[2],
    height: row[3],
    whole_weight: row[4],
    shucked_weight: row[5],
    viscera_weight: row[6],
    shell_weight: row[7],
    rings: row[8]
  )
end

puts "✅ Seeding complete! #{Animal.count} records added."
