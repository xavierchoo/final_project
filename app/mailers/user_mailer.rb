class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.subscription_confirmation.subject
  #
  def subscription_confirmation(current_user)
    @greeting = "Hi"

    mail (to: current_user, subject: NewsPlus "Subscription")
  end
end
