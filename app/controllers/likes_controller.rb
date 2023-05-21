class LikesController < ApplicationController
    before_action :set_like, only: [:show, :destroy]

    # GET /likes
  def index
    @likes = Like.all
    render json: @likes
  end

  # GET /likes/:id
  def show
    render json: @like
  end

  # POST /likes
  def create
    @like = Like.new(like_params)

    if @like.save
      render json: @like, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/:id
  def destroy
    @like.destroy
    head :no_content
  end

  private

  # Set the like based on the :id parameter
  def set_like
    @like = Like.find(params[:id])
  end

  # Only allow the specified parameters for like creation
  def like_params
    params.permit(:entity_id, :entity_type, :user_id)
  end
end
