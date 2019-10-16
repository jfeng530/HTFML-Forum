class CommentsController < ApplicationController
    
    def create
        # byebug
        @article = Article.find(params[:id])
        if Comment.create(text: params[:comment][:text], article_id: @article.id)
            flash[:notice] = "Comment Added!"
            redirect_to category_article_path(@article)
        else
            flash[:notice] = "Comment Couldn't Added Try Again..."
            redirect_to article_path(@article)
        end
    end

    def destroy
        byebug
    end

end