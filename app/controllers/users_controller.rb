

class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :destroy]

    def index
        @users = User.all
        render json: @users
      end

    def show
        @user = User.find(params[:id])
        render json: @user
      end
    
    def create
        @user = User.new(user_params)
        
        if @user.save
          WelcomeEmailJob.perform_later(@user)
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

    def destroy
      @user.destroy
      head :no_content
    end
      
      private
      
      def user_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :birth_date, :profile_picture)
      end

      def set_user
        @user = User.find(params[:id])
      end
end
