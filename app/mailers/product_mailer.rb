class ProductMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.product_created.subject
  #
  before_action :set_object

  def product_created
    mail(to: @object.user.try(:email), subject: 'Product Informations')
  end

  private

  def set_object
    @object = params[:object]
  end
end
