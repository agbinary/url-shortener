# app/controllers/api/v1/urls_controller.rb
module API
  module V1
    class UrlsController < ApplicationController
      def shorten
        url = Url.new(url_params)
        if url.save
          url.shorten
          render json: url, root: 'url', adapter: :json, status: :ok
        else
          render json: url.errors.messages, status: :unprocessable_entity
        end
      end

      private

      def url_params
        params.require(:url).permit(:original)
      end
    end
  end
end
