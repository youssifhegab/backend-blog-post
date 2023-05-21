class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]

    # GET /posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
    likes_count = @post.likes.count

    render json: { post: @post, likes_count: likes_count }
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    head :no_content
  end

  private

  # Set the post based on the :id parameter
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow the specified parameters for post creation and updates
  def post_params
    params.permit(:title, :body, :user_id)
  end

end
