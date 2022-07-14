class ListsController < ApplicationController
  before_action :set_list, only: :show
  before_action :authenticate_user!

  def index
    @lists = List.where(user: current_user)
    render partial: 'lists/lists', locals: { lists: @lists }
  end

  def show
    user_not_authorized if @list.user != current_user
  end

  def clear_items
    @list = List.find(params[:list_id])
    
    if @list.items.destroy_all
      render turbo_stream: turbo_stream.replace(:items, partial: 'items/items', locals: { items: nil })
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
end
