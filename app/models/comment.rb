class Comment < ApplicationRecord
    belongs_to :post
    has_many :likes, as: :entity

    validate :validate_body

    private

    def validate_body
        if body.present? && body.downcase.match?(/dog|cat/)
          errors.add(:body, "cannot contain inappropriate words")
        end
    end

end
