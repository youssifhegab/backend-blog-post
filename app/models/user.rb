class User < ApplicationRecord
    require 'securerandom'
    after_create_commit :enqueue_welcome_email_job
    has_many :posts
    has_many :likes

    has_secure_password

    validates_uniqueness_of :email, case_sensitive: true
    validate :validate_birthdate

    validates :password, length: { minimum: 6 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :birth_date, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def validate_birthdate
    
        today = Date.today
        valid_date = today - 15.years
        if birth_date > valid_date
          errors.add(:birth_date, "must be at least 15 years old")
        end
      end

    private

    def enqueue_welcome_email_job
      WelcomeEmailJob.perform_later(id)
    end
end
