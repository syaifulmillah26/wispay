class ApplicationMailer < ActionMailer::Base
  default from: ENV['ACCOUNT_MAIL']
  layout 'mailer'
end
