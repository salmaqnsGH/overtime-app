@user = User.create(email: "test2@test.com", password:"asdfasdf", password_confirmation:"asdfasdf", first_name: "sal", last_name:"salam")
AdminUser.create(email: "admin2@test.com", password:"asdfasdf", password_confirmation:"asdfasdf", first_name: "sal", last_name:"admin2")
puts "1 admin user created"

20.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id )
end

puts "20 post created"