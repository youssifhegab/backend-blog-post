class WelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find_by(id: user_id)
    # return unless user
    # # Send the welcome email using Sendinblue
    #\send_welcome_email(user)
    UserMailer.welcome_email(user).deliver_now!
  end

  private
end
