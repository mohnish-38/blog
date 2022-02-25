class UsersController < ApplicationController
    before_action :set_user , only: [:edit, :update, :show]
    def new
        @user =User.new
    end

    def edit
        
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to the Blog, you have successfully signed up"
            redirect_to articles_path
        else
           render 'new' , status: :unprocessable_entity
        end 
    end

    def update
      if @user.update(user_params)
        redirect_to users_path
      else
        render :edit,  status: :unprocessable_entity
      end
    end

    def index
        @users = User.all
    end

    def show
        @articles = @user.articles
    end

    
    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end    
end
