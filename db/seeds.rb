require 'csv'

CSV.foreach(Rails.root.join('db', 'abalone.csv'), headers: true) do |row|
  Abalone.create!(
    sex: row['sex'],
    length: row['length'].to_f,
    diameter: row['diameter'].to_f,
    height: row['height'].to_f,
    whole_weight: row['whole_weight'].to_f,
    shucked_weight: row['shucked_weight'].to_f,
    viscera_weight: row['viscera_weight'].to_f,
    shell_weight: row['shell_weight'].to_f,
    rings: row['rings'].to_i
  )
end

puts "Seeding completed successfully!"
