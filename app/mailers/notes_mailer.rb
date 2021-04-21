class NotesMailer < ApplicationMailer

  def note_email
    @note = params[:note]
    @recipient = params[:recipient]
    mail(:to => @note.user.email, :subject => "#{@note.user.name} sent you a note!")       
  end

end
