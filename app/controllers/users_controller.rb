# frozen_string_literal: true

# user controller
class UsersController < ResourceController
  exception = %i[create email_confirmation forgot_password set_new_password]
  before_action :authenticate_user, except: exception
  before_action :validate_user, only: %i[update destroy]

  def index
    status, result = Contacts::Index.new(
      current_user, limit: params[:limit], offset: params[:offset]
    ).perform

    render json: result, status: status
  rescue StandardError => e
    render json: { error: e.message }, status: 500
  end

  def forgot_password
    status, result = Account::ForgotPassword.new(
      params[:email]
    ).perform

    render json: result, status: status
  rescue StandardError => e
    render json: { error: e.message }, status: 500
  end

  def set_new_password
    status, result = Account::ResetPassword.new(
      params[:email], params[:token], params[:password]
    ).perform

    render json: result, status: status
  rescue StandardError => e
    render json: { error: e.message }, status: 500
  end

  private

  def validate_user
    return route_not_found if @object.id != current_user.id
  end
end
