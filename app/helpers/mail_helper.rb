# frozen_string_literal: true

# helper
module MailHelper
  def send_mail_forgot_password_instruction(user)
    DeviseMailer.with(object: user).reset_password_instructions.deliver_later
  end

  def send_mail_password_changed(user)
    DeviseMailer.with(object: user).password_change.deliver_later
  end

  def send_mail_product_information(product)
    ProductMailer.with(object: product).product_created.deliver_later
  end
end
