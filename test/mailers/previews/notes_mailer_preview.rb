# Preview all emails at http://localhost:3000/rails/mailers/notes_mailer
class NotesMailerPreview < ActionMailer::Preview

  def note_email
  note = Note.new(user: User.first, title: "TEST NOTE", content: "I want to send a Note!")

  NotesMailer.with(note: note).note_email
  end
end
