class Article < ApplicationRecord
    belongs_to :category
    has_many :comments
    has_rich_text :content

    validates :content, presence: true
    validates :title, presence: true
    validates :category_id, presence: true

    def to_param
        "#{id}-#{title.parameterize}"
    end

end
