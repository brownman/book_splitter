class PagesController < ApplicationController

  def home
    @title = "Home"
    if signed_in?
      #@micropost = Micropost.new
      #@feed_items = current_user.feed.paginate(:page => params[:page])
      # compares_path , :id => current_user.id
      #@compares = current_user.compares

      @smiles = current_user.smiles

  @smile = Smile.new(:user_id => current_user.id)
      #@todos = current_user.todos

      #@ideas = current_user.ideas
  #@lines = Line.all
  #@line = Line.new(:user_id => params[:user_id] , :parent_id => params[:parent_id])

    end
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"

#puts ActionView::Helpers::JavaScriptHelper::JS_ESCAPE_MAP

  end
  
  def help
    @title = "Help"
  end
end
