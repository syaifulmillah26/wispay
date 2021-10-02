# frozen_string_literal: true

# resource class
class ResourceController < ApplicationController
  before_action :authenticate_user
  before_action :set_object, only: %i[show update destroy]

  def index
    @objects = model_class
    render json: results(@objects), status: 200
  rescue StandardError => e
    render json: { message: e.message }, status: 500
  end

  def new
    render model_class.new
  end

  def create
    @object = model_class.create(permitted_resource_params)
    instance_variable_set("@#{object_name}", @object)
    return invalid_resource!(@object) unless @object.save

    render json: result(@object), status: 201
  rescue StandardError => e
    render json: { error: e.message }, status: 500
  end

  def show
    render json: result(@object), status: 200
  rescue StandardError => e
    render json: { error: e.message }, status: 500
  end

  def update
    permit = permitted_resource_params
    return invalid_resource!(@object) unless @object.update(permit)

    render json: result(@object), status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: 500
  end

  def destroy
    return invalid_resource!(@object) unless @object.destroy

    render json: { message: t('wispay.success') }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: 500
  end

  private

  def set_object
    @object = model_class.find(params[:id])
  rescue StandardError => e
    render json: { error: e.message }, status: 500
  end

  def permitted_resource_params
    acp = ActionController::Parameters.new.permit!
    params[object_name].present? ? params.require(object_name).permit! : acp
  end

  def model_class
    controller_name.classify.to_s.constantize
  end

  def object_name
    controller_name.singularize
  end
end
