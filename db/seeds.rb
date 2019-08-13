USERS_COUNT = 10

random_users = HTTParty.get("https://randomuser.me/api/?results=#{USERS_COUNT}")

random_users['results'].each_with_index do |random_user, index|

  u = User.create!( email: "test#{index}@test.com",
                    password: '123123',
                    name: "#{random_user['name']['first'].capitalize} #{random_user['name']['last'].capitalize}",
                    avatar_url: random_user['picture']['medium'] )

  puts "create user #{u.name}"
end