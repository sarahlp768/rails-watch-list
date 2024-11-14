class BookmarksController < ApplicationController

def new
  @bookmark = Bookmark.new
  @list = List.find(params[:list_id])
end

def create
  @bookmark = Bookmark.new(bookmark_params)
  if @bookmark.save!
    redirect_to list_path(@list)
  else
    render :new, alert: "Error with the bookmark creation."
  end
end

private

def bookmark_params
  params.require(:bookmark).permit(:comment, :movie, :list)
end

end