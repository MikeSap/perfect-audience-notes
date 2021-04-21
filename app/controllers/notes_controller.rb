class NotesController < ApplicationController

def index
end

def show
end

def new
  @note = Note.new
end

def create
  @note =  Note.new(note_params.merge(user: @current_user))
  if @note.title.empty?
    @note.title = @note.content[0..29]
  end
  if @note.valid?
    @note.save
    flash[:alert] = nil
    return redirect_to root_path
  else
    flash[:alert] = @note.errors.full_messages[0]
    render :new
  end 
end

def edit
  @note = Note.find(params[:id])
end

def update
  @note = Note.find(params[:id])
  if note_params["title"].empty?
    @note.title = note_params["content"][0..29]
    @note.content = note_params["content"]
    return redirect_to root_path if @note.save
  end
    @note.title = note_params["title"]
    @note.content = note_params["content"]
  if @note.valid?
    @note.save
    flash[:alert] = nil
    return redirect_to root_path
  else
    flash[:alert] = @note.errors.full_messages[0]
    render :new
  end
end

def destroy
  Note.destroy(params[:id])
  redirect_to root_path
end

def send_note
  @note = Note.find(params[:id])
  NotesMailer.with(note: @note).note_email.deliver_later
  redirect_to root_path
end

private

def note_params
  params.require(:note).permit(:title, :content)
end

end
