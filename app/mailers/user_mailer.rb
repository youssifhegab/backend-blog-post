class UserMailer < ApplicationMailer
    default from: 'youssif.hegab123@gmail.com'
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to My Awesome App')
    end
end
