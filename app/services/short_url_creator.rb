# app/services/short_url_creator.rb
class ShortUrlCreator < ApplicationService
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def call
    generate_short_url
  end

  private

  def generate_short_url
    chars = generate_possible_chars
    short_url = (0...7).map { chars[rand(chars.length)] }.join

    url.update(shortened: short_url)
  end

  def generate_possible_chars
    ['0'..'9', 'A'..'Z', 'a'..'z'].map(&:to_a).flatten
  end
end
