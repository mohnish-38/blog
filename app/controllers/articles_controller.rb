class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    
    def index
    @articles = Article.all
    end

    def show
    
    end

    def new
        @article = Article.new
    end

    def edit
        
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            redirect_to article_path(@article)
        else
            render :new, status: :unprocessable_entity
        
        end
    end 
    
    def update
        
        if @article.update(article_params)
            redirect_to article_path
        else
            render :edit, status: :unprocessable_entity
        end
        
    end

    def destroy
       
       @article.destroy
       redirect_to articles_path, status: :see_other
    end

    private

    def article_params
        params.require(:article).permit(:title, :description)
    end

    def set_article
        @article = Article.find(params[:id])
    end

end
