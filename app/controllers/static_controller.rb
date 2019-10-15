class StaticController < ApplicationController

    def welcome
        if params[:query]
            redirect_to "/categories/1-politics/articles/?query=#{params[:query]}"
        end
    end

end