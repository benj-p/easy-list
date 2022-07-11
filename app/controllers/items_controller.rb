class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy]
  before_action :set_items, only: [:index, :update]

  def index
    render partial: 'items/items', locals: { items: @items }
  end

  def create
    item = Item.new(item_params)
    if item.save
      render turbo_stream: [
        turbo_stream.prepend(:items, partial: 'items/item', locals: { item: item }),
        turbo_stream.update(:items_count, Item.not_done.count),
        turbo_stream.replace('add-item-wrapper', partial: 'items/add_item_button', locals: { list: item.list })
      ]
    else
      render turbo_stream: turbo_stream.replace('item_form', partial: 'items/form', locals: { list: item.list, item: item })
    end
  end

  def update
    if @item.update(item_params)
      render turbo_stream: [
        turbo_stream.replace(:items, partial: 'items/items', locals: { items: @items }),
        turbo_stream.update(:items_count, Item.not_done.count)
      ]
    end
  end

  def destroy
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :done, :list_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_items
    @items = Item.order(done: :asc, updated_at: :desc)
  end
end
