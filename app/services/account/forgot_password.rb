# frozen_string_literal: true

module Account
  # ForgotPassword
  class ForgotPassword
    include ApplicationHelper
    attr_reader :email

    def initialize(email)
      @email = email
    end

    # perform
    def perform
      return err_message(I18n.t('wispay.not_found', r: 'Email')) if user.blank?

      @user.update_column(:reset_password_token, secure_random_hex)
      @user.update_column(:reset_password_sent_at, current_time)

      send_mail
      ok_message(t('wispay.account.new_link_password'))
    end

    private

    def user
      @user = User.find_by_email(@email)
    end

    def send_mail
      Mailer::SendForgotPassword.perform_async(@user.id)
    end
  end
end
