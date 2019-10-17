class CommentsController < ApplicationController

    def create
        # byebug
        @article = Article.find(params[:id])
        if Comment.create(text: params[:comment][:text], article_id: @article.id).valid?
            flash[:notice] = "Comment Added!"
            redirect_to category_article_path(@article)
        else
            flash[:notice] = "Comment Should Not Be Blank! Please Try Again..."
            redirect_to category_article_path(@article)
        end
    end

    def destroy
        # byebug
        Comment.delete(params[:id])
        redirect_to admin_article_path(Article.find(params[:article_id]))
    end


end