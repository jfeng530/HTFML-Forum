class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]


    layout "show_lo", :only => [:show]
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
      @related_articles1 = []
      @article = Article.find(params[:id])
      @comment = Comment.new
      @article_title_words = @article.title.downcase.split(' ')

      @related_articles = Article.all.select{|art| (art.title.downcase.split(' ') & @article_title_words).any? }
      @related_articles.delete_if{ |ra| ra == @article}
      # byebug
      if @related_articles.count > 3
        3.times do
          x = rand(0...@related_articles.size)
          @related_articles1 << @related_articles[x]
          @related_articles[x].delete
        end
      else
        @related_articles1 = @related_articles.uniq
      end
      # byebug
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
