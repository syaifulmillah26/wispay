# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  include Knock::Authenticable
  include ApplicationHelper
  before_action :authenticate_user
  undef_method :current_user

  def invalid_resource!(resource)
    Rails.logger.error "resouce_errors => #{resource.errors.full_messages}"
    render json: { error: resource.errors.full_messages }, status: 422
  end

  def route_not_found
    render json: {
      message: t('wispay.route_not_found')
    }, status: 404
  end

  def render_err(message)
    render json: { message: message }, status: 422
  end

  def render_ok(data)
    render json: data, status: 200
  end

  def search?
    @objects = @objects.search_by_term(params[:search]) if \
      params[:search].present?
  end

  def limit_and_offset
    @limit = params[:limit] || 10
    @offset = params[:offset] || 0
    @objects = @objects.limit(@limit)
    @objects = @objects.offset(@offset)
  end
end
