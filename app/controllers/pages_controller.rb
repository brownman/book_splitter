class PagesController < ApplicationController

  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
      # compares_path , :id => current_user.id
      @compares = current_user.compares

      @smarts = current_user.smarts
      @todos = current_user.todos

      @ideas = current_user.ideas
    end
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"

puts ActionView::Helpers::JavaScriptHelper::JS_ESCAPE_MAP

  end
  
  def help
    @title = "Help"
  end
end
