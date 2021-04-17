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
  return render :new unless @note.save
  redirect_to root_path
end

def edit
  @note = Note.find(params[:id])
end

def update
  @note = Note.find(params[:id])
  @note.update(note_params)
  redirect_to root_path
end

def destroy
  Note.destroy(params[:id])
  redirect_to root_path
end

private

def note_params
  params.require(:note).permit(:title, :content)
end

end
