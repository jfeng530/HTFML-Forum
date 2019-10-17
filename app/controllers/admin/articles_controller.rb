class Admin::ArticlesController < ApplicationController
  # before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  layout 'base', :only => [:new]
  layout 'admin'

  # GET /articles
  # GET /articles.json
  def index
    if params[:search]
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
    # byebug
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
    # byebug
    if @article.update!(article_params)
        flash[:success] = "Edits Has Been Saved!"
        # @article.update(article_params)
        redirect_to admin_article_path(@article)
    else
        flash[:fail] = "Edits Has Not Been Saved! Make Sure You Didn't Leave Blank Section!"
        redirect_to edit_admin_article_path(@article)
    end
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
      params[:article] = {}
      params[:article][:title] = params[:title]
      params[:article][:content] = params[:content]
      params[:article][:category_id] = params[:category_id]
      params.require(:article).permit(:title, :content, :category_id)
    end

end
