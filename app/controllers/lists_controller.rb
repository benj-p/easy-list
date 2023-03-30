class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @lists = List.where(user: current_user)
    render partial: 'lists/lists', locals: { lists: @lists }
  end

  def show
    user_not_authorized if @list.user != current_user
  end

  def destroy
    if @list.destroy
      render turbo_stream: turbo_stream.replace(:lists, partial: 'lists/list', collection: current_user.lists)
    end
  end

  def clear_items
    @list = List.find(params[:list_id])
    
    if @list.items.destroy_all
      render turbo_stream: [
        turbo_stream.replace(:items, partial: 'items/items', locals: { items: nil }),
        turbo_stream.update(:items_count, 0)
      ]
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
end
