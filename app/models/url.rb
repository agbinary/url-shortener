# app/models/url.rb
class Url < ApplicationRecord
  validates :original, uniqueness: true, presence: true, url: true

  def shortener
    ShortUrlCreator.call(self)
  end
end
