class Category < ApplicationRecord
    has_many :articles

    def to_param
        "#{id}-#{name.parameterize}"
    end

end
