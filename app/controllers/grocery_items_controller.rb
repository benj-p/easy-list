class GroceryItemsController < ApplicationController
  def index
    @grocery_items = GroceryItem.all
    render partial: 'grocery_items/grocery_items', locals: { grocery_items: @grocery_items.needed }
  end

  def create
    grocery_item = GroceryItem.new(grocery_item_params)
    if grocery_item.save
      render turbo_stream: [
        turbo_stream.append(:grocery_items, partial: 'grocery_items/grocery_item', locals: { grocery_item: grocery_item }),
        turbo_stream.update(:grocery_items_count, GroceryItem.needed.count),
        turbo_stream.replace(:grocery_item_form, partial: 'grocery_items/form', locals: { grocery_item: GroceryItem.new})
      ]
    else
      render turbo_stream: turbo_stream.replace(:grocery_item_form, partial: 'grocery_items/form', locals: { grocery_item: grocery_item})
    end
  end

  private

  def grocery_item_params
    params.require(:grocery_item).permit(:name)
  end
end
