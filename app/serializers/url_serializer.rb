# app/serializers/url_serializer.rb
class UrlSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :original, :shortened

  def shortened
    expand_url(shortened_url: object.shortened)
  end
end
