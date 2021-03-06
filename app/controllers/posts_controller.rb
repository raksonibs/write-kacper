class PostsController < ApplicationController
  # before_filter :authenticate_user!, only: [:create, :edit, :update, :delete]

  def index
    @posts = Post.all.order('id')
    respond_with @posts
  end

  def first
    @post = Post.first

    respond_with [@post]
  end

  def create
    respond_with Post.create(post_params)
  end

  def show
    # both show and edit go here. The save will have to go to an update action
    # also show when not logged in will have to be a different view
    @post = Post.friendly.find(params[:id])
    respond_with @post
  end

  def update
    @post = Post.find(params[:id])

    @post.update_attributes(post_params)

    respond_with @post
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :published_at, :id, :link, :created_at, :posted_at, :teaser, :slug, :photo)
  end
end
