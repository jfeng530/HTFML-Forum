class CommentsController < ApplicationController
  # validates :created_at, :presence => true

    def create
        # byebug
        @article = Article.find(params[:id])
        @comment = Comment.new(text: params[:comment][:text], article_id: @article.id)

        if @comment.valid?
            @comment.save
            flash[:notice] = "Comment Added!"
            # redirect_to category_article_path(@article)
        else
            flash[:notice] = "Comment Should Not Be Blank!"
            # redirect_to category_article_path(@article)
        end

        respond_to do |format|
            format.json { render json: @comment }
            format.html { render layout => false }
            format.js
          end

    end

    def destroy
        # byebug
        Comment.delete(params[:id])
        redirect_to admin_article_path(Article.find(params[:article_id]))
    end


end
