require 'faker'

mike =  User.create(username:"mike", password: "123", password_confirmation: "123")

note1 = Note.create(title: "1", content: "123", user: mike)
note2 = Note.create(title: "2", content: "456", user: mike)
note3 = Note.create(title: "3", content: "789", user: mike)

