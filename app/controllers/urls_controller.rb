# app/controllers/urls_controller.rb
class UrlsController < ApplicationController
  def expand
    url = Url.find_by_shortened(params[:shortened_url])

    redirect_to url.original
  end
end
