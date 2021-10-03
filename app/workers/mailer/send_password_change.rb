# frozen_string_literal: true

module Mailer
  # SendPasswordChange
  class SendPasswordChange
    include Sidekiq::Worker
    sidekiq_options retry: false
    sidekiq_options queue: :default

    def perform(user_id)
      user = User.find_by_id(user_id)

      puts 'sending email password change'
      DeviseMailer.with(object: user).password_change.deliver
    end
  end
end
