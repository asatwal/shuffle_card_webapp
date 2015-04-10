Fabricator :card do

  rank            Faker::Lorem.word()
  suit            Faker::Lorem.word()
  position        Faker::Number.number(1)
  
end