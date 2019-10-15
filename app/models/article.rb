class Article < ApplicationRecord
    belongs_to :category
    has_rich_text :content

    def to_param
        "#{id}-#{title.parameterize}"
    end


end
