# frozen_string_literal: true

module Account
  # ResetPassword
  class ResetPassword
    include ApplicationHelper
    include MailHelper
    attr_reader :email, :token, :password

    def initialize(email, token, password)
      @email = email
      @token = token
      @password = password
    end

    # perform reset password
    def perform
      return err_message(t('wispay.account.token_expired')) if user.blank?

      @user.update_column(:encrypted_password, hashed_password)
      @user.update_column(:reset_password_token, nil)
      send_mail_password_changed(@user)

      ok_message(t('wispay.success'))
    end

    private

    def user
      @user = User.find_by(email: @email, reset_password_token: @token)
    end

    def hashed_password
      BCrypt::Password.create(@password)
    end
  end
end
