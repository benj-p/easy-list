class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @notes = Note.where(user: current_user).ordered_by_rank
    render partial: 'notes/notes', locals: { notes: @notes }
  end

  def show
    user_not_authorized if @note.user != current_user
  end

  def new; end

  def create
    @note = Note.new(note_params)
    @note.user = current_user

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

  def destroy
    if @note.destroy
      render turbo_stream: turbo_stream.remove(@note)
    end
  end

  def update_ranks
    params["ranks"].each do |id, rank|
      Note.find(id).update(rank: rank)
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body, :user_id)
  end
end
