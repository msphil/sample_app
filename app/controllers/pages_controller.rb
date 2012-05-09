class PagesController < ApplicationController

  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      if params[:search] and params[:search].length > 0
        @feed_items = current_user.feed.search(params[:search], :match_mode => :any).paginate(:page => params[:page])
      else
        @feed_items = current_user.feed.paginate(:page => params[:page])
      end
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

end
