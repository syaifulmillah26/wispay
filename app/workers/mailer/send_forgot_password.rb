# frozen_string_literal: true

module Mailer
  # SendForgotPassword
  class SendForgotPassword
    include Sidekiq::Worker
    sidekiq_options retry: false
    sidekiq_options queue: :default

    def perform(user_id)
      user = User.find_by_id(user_id)

      puts 'sending email password instructions'
      DeviseMailer.with(object: user).reset_password_instructions.deliver
    end
  end
end
