class Blog < ApplicationRecord
    belongs_to :student

    # validations
    validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5, maximum: 20}

    validates :content, presence: true
end
