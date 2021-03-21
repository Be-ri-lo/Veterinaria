# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Client.destroy_all
10.times do

    client = Client.create(name: Faker::Name.name,
                           phone: Faker::PhoneNumber.phone_number_with_country_code,
                           email: Faker::Internet.safe_email)
        puts "Los datos del cliente son: #{client.name}"
    
    pet = client.pets.build(name: Faker::Name.first_name,
                    breed: Faker::Creature::Animal.name,
                    birthday: Date.today - (5..30).to_a.sample.years,
                    )
    pet.save
    puts "El animal es: #{pet.name}" 

    rand(5..15).times do
        history = pet.histories.build(date: Date.today - (1..30).to_a.sample.days, 
                                      weight: rand(3..100), height: rand(1..240), 
                                      description: Faker::Lorem.paragraph(sentence_count: 2))
        history.save
        puts "La cantidad de visitas son: #{history.date}"
    end    
end


#como hacer para que al primer dato se le vaya aumentando las cifras o manteniendo, pero nunca ser tan diferentes.