# Url Validator
class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if record.original.blank?

    error_message = options[:message] || 'must be a valid URL'
    record.errors[attribute] << error_message unless url_valid?(value)
  end

  def url_valid?(url)
    url = URI.parse(url)
    url.is_a?(URI::HTTP) || url.is_a?(URI::HTTPS)
  end
end
