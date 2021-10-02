# frozen_string_literal: true

module Account
  # ForgotPassword
  class ForgotPassword
    include ApplicationHelper
    include MailHelper
    attr_reader :email

    def initialize(email)
      @email = email
    end

    # perform
    def perform
      return err_message(I18n.t('wispay.not_found', r: 'Email')) if user.blank?

      user.update_column(:reset_password_token, secure_random_hex)
      user.update_column(:reset_password_sent_at, current_time)
      send_mail_forgot_password_instruction(user)

      ok_message(t('wispay.account.new_link_password'))
    end

    private

    def user
      User.find_by_email(@email)
    end
  end
end
