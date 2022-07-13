class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update]

  def index
    @notes = Note.all
    render partial: 'notes/notes', locals: { notes: @notes }
  end

  def show; end

  def new
    
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note
    end
  end

  def update
    if @note.update(note_params)
      render turbo_stream: [
        turbo_stream.replace("edit_form", partial: 'notes/edit_form', locals: { note: @note }),
        turbo_stream.replace("spinner", partial: 'shared/spinner')
      ]
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
