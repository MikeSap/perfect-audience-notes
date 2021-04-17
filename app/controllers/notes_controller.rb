class NotesController < ApplicationController

def new

end

def create

end

def edit
  @note = Note.find(params[:id])
  redirect_to_edit_note_path
end

def update

end

def destroy
  Note.destroy(params[:id])
  redirect_to root_path
end

end
