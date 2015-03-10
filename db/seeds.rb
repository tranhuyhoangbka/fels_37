User.create!(name: 'hoangbk', email: 'hoangth92.nd@ex.com', password: '123456',
  password_confirmation: '123456', admin: true)
User.create!(name: 'khuongbk', email: 'khuongbk@ex.com', password: '123456',
  password_confirmation: '123456')
Category.create!(name: 'Basic 500')
Category.create!(name: 'At a Restaurant')
Category.create!(name: 'On a Trip')

500.times do |n|
  content = Faker::Lorem.word
  Word.create!(content: content, category_id: 1)
end

500.times do |i|
  content = Faker::Lorem.word
  Answer.create!(content: content, status: true, word_id: i + 1) 
end

500.times do |i|
  content = Faker::Lorem.word
  Answer.create!(content: content, status: false, word_id: i + 1)
end

500.times do |i|
  content = Faker::Lorem.word
  Answer.create!(content: content, status: false, word_id: i + 1)  
end

500.times do |i|
  content = Faker::Lorem.word
  Answer.create!(content: content, status: false, word_id: i + 1)  
end

100.times do |n|
  content = Faker::Lorem.word
  Word.create!(content: content, category_id: 2)
end

100.times do |i|
  content = Faker::Lorem.word
  Answer.create!(content: content, status: true, word_id: i + 501)  
end

100.times do |i|
  content = Faker::Lorem.word
  Answer.create!(content: content, status: false, word_id: i + 501)  
end

100.times do |i|
  content = Faker::Lorem.word
  Answer.create!(content: content, status: false, word_id: i + 501)
end

100.times do |i|
  content = Faker::Lorem.word
  Answer.create!(content: content, status: false, word_id: i + 501)  
end

100.times do |n|
  content = Faker::Lorem.word
  Word.create!(content: content, category_id: 3)
end

100.times do |i|  
  content = Faker::Lorem.word
  Answer.create!(content: content, status: true, word_id: i + 601)  
end

100.times do |i|
  content = Faker::Lorem.word
  Answer.create!(content: content, status: false, word_id: i + 601)  
end

100.times do |i|
  content = Faker::Lorem.word
  Answer.create!(content: content, status: false, word_id: i + 601)  
end

100.times do |i|
  content = Faker::Lorem.word
  Answer.create!(content: content, status: false, word_id: i + 601)  
end

20.times do |i|
  Learned.create!(user_id: 1, word_id: n, category_id: i + 1)  
end

20.times do |i|
  Learned.create!(user_id: 1, word_id: i + 501, category_id: 2)  
end

20.times do |i|
  Learned.create!(user_id: 2, word_id: i + 501, category_id: 2)  
end
