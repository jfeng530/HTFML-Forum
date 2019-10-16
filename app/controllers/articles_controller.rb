class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
  
    # GET /articles
    # GET /articles.json
    def index
      @category = Category.find(params[:category_id])
  
      if params[:search]
        #MAKE SEARCH WITH SQL COMMAND ## W H E R E ##
        @articles = Article.all.select{|art| art.title.downcase.include?(params[:search].downcase)}
        if @articles == []
          @s = true
        else
          
        end
      else
        @articles = Article.all.select{|art| art.category_id.to_i == @category.id}
        if @articles == []
          @t = true
        else
          
        end
      end
  
    end

    def show
      @comment = Comment.new
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def article_params
        params.fetch(:article, {})
      end
  end