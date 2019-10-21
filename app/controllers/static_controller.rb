class StaticController < ApplicationController
    layout 'test1', only: [:test]
    # layout 'base'
    def welcome
        if params[:query]
            redirect_to "/categories/1-politics/articles/?query=#{params[:query]}"
        end
    end

    def test
        @articles = Article.all
    end

end
