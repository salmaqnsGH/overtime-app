20.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content" )
end

puts "20 post created"