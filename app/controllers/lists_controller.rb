class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save!
      redirect_to list_path(@list)
    else
      render :new, alert: "Error with the list creation."
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

end
