class PagesController < ApplicationController
  def home
    @grocery_items = GroceryItem.all
  end
end
