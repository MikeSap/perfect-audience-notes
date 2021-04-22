require 'faker'

mike =  User.create(name:"Mike", email:"mikesapdev@gmail.com", password: "123", password_confirmation: "123")
thamas = User.create(name:"Thamas", email:"Thamas.Mcgowan@PerfectAudience.com", password: "123", password_confirmation: "123")
sean = User.create(name:"Sean", email:"Sean.Dodds@Sharpspring.com", password: "123", password_confirmation: "123")

users = [mike, thamas, sean]

150.times do
note = Note.create(title: Faker::Hacker.abbreviation , content: Faker::Hacker.say_something_smart, user: users.sample)
end