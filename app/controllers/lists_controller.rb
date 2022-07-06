class ListsController < ApplicationController
  before_action :set_list, only: :show

  def index
    @lists = List.all
    render partial: 'lists/lists', locals: { lists: @lists }
  end

  def show
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
end
