# frozen_string_literal: true

# This file was generated by Bundler.

#
# The application 'rspec' is installed as part of a gem, and
# this file is here to facilitate running it.
#

module ApplicationHelper
  def desc(object)
    object.order('id DESC')
  end

  def asc(object)
    object.order('id ASC')
  end

  def serializer(object, opt = {})
    ActiveModelSerializers::SerializableResource.new(
      object, opt
    ).as_json
  end

  def t(data)
    I18n.t(data)
  end

  def err_message(message)
    [422, { message: message }]
  end

  def ok_message(message)
    [200, { message: message }]
  end

  def current_time
    DateTime.now
  end

  def secure_random_hex
    SecureRandom.hex(30)
  end

  def total
    @objects.count
  end

  def result(object)
    { message: t('wispay.success'), data: serializer(object) }
  end

  def results(objects)
    @objects = objects
    search?
    @total = total
    limit_and_offset
    datas
  end

  def datas
    {
      message: t('wispay.success'), total: @total,
      limit: @limit,
      offset: @offset,
      data: serializer(desc(@objects))
    }
  end

  def search?
    @objects = @objects.search_by_term(@search) if \
      @search.present?
  end

  def limit_and_offset
    @objects = @objects.limit(@limit)
    @objects = @objects.offset(@offset)
  end
end