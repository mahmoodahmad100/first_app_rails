class PostsController < ApplicationController

	def index
		@title = "blog posts"
		@search = Post.search(params[:search])
		@posts = @search.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@categories = Category.all
	end

	def create
		@post = Post.new(params[:post])
		if @post.save
			redirect_to posts_path, :notice => "well done you did it!"
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
	end

	def update
		@post = Post.find(params[:id]) 
		if @post.update_attributes(params[:post])
			redirect_to posts_path, :notice => "you updated the post"
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "you deleted the post"
	end

end
