class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes, as: :entity
    before_save :capitalize_title

    validate :validate_body_and_title

    private

    def validate_body_and_title
        if body.present? && body.downcase.match?(/dog|cat/)
          errors.add(:body, "cannot contain inappropriate words")
        end

        if title.present? && title.downcase.match?(/dog|cat/)
          errors.add(:title, "cannot contain inappropriate words")
        end
    end

    def capitalize_title
      self.title = title.capitalize if title.present?
      self.body = body.capitalize if body.present?
    end
end
