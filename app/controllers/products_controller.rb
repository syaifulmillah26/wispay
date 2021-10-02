# frozen_string_literal: true

# Products controller
class ProductsController < ResourceController
  before_action :set_user, only: :create
  before_action :set_object, only: %i[show update destroy upload_image]
  before_action :validate_user, only: %i[update destroy]

  def index
    @objects = model_class
    render json: results(@objects.with_attached_image), status: 200
  rescue StandardError => e
    render json: { message: e.message }, status: 500
  end

  private

  def set_user
    params[:product][:user_id] = current_user.id
  end

  def validate_user
    return route_not_found if @object.user_id != current_user.id
  end
end
