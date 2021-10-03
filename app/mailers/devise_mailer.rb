# frozen_string_literal: true

# This file was sending an email
class DeviseMailer < Devise::Mailer
  default template_path: 'devise/mailer'
  default from: ENV['ACCOUNT_MAIL']

  before_action :set_object

  def reset_password_instructions
    mail(to: @object.try(:email), subject: 'Reset Password Instructions')
  end

  def password_change
    mail(to: @object.try(:email), subject: 'Password Changed')
  end

  private

  def set_object
    @object = params[:object]
  end
end
