class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :all_categories
  helper_method :all_posts
  before_filter :search_posts

  def all_categories
  	@categories = Category.all
  end

  def all_posts
  	@posts = Post.all
  end

  def search_posts
	@search    = Post.search(params[:search])
	@posts_res = @search.all 	
  end

end
