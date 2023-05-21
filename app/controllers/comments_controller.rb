class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]

    # GET /comments
  def index
    @comments = Comment.all
    render json: @comments
  end

  # GET /comments/:id
  def show
    @comment = Comment.find(params[:id])
    likes_count = @comment.likes.count
    render json: { post: @comment, likes_count: likes_count }
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/:id
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/:id
  def destroy
    @comment.destroy
    head :no_content
  end

  private

  # Set the comment based on the :id parameter
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow the specified parameters for comment creation and updates
  def comment_params
    params.permit(:body, :post_id)
  end
end
