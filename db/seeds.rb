require 'faker'

mike =  User.create(username:"mike", password: "123", password_confirmation: "123")

note1 = Note.create(title: "1", content: "123", user: mike)
note2 = Note.create(title: "2", content: "456", user: mike)
note3 = Note.create(title: "3", content: "789", user: mike)
note4 = Note.create(title: "4", content: "10", user: mike)
note5 = Note.create(title: "5", content: "11", user: mike)
note6 = Note.create(title: "6", content: "12", user: mike)

