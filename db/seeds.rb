@user = User.create(email: "test@test.com", password:"asdfasdf", password_confirmation:"asdfasdf", first_name: "sal", last_name:"salam")

20.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id )
end

puts "20 post created"