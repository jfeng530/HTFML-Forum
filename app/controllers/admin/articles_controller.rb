class Admin::ArticlesController < ApplicationController
  # before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  layout 'admin'
  layout 'base', :only => [:new]
  # GET /articles
  # GET /articles.json
  def index
    if params[:query]
      #MAKE SEARCH WITH SQL COMMAND ## W H E R E ##
      @articles = Article.all.select{|art| art.title.downcase.include?(params[:search].downcase)}
    else 
      @articles = Article.all
    end

    if @articles == []
      @s = true
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new(title: "new-article")
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(title: params[:title], content: params[:content], category_id: params[:category_id])
    # byebug
    redirect_to "/admin/articles/#{@article.to_param}"
  end

  def update
    @article = Article.find(params[:id])
    if !params[:title].empty?
      @article.update(title: params[:title])
    end
    if !params[:content].empty?
      @article.update(content: params[:content])
    end
    if params[:category_id]
      @article.update(category_id: params[:category_id])
    end
    
    redirect_to "/admin/articles/#{params[:id]}"
  end

  def destroy
    # byebug
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to "/admin/articles"
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
