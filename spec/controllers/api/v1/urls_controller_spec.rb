require 'rails_helper'

describe API::V1::UrlsController, type: :controller do
  let(:valid_url_params) do
    {
      url: {
        original: Faker::Internet.url
      }
    }
  end

  let(:invalid_url_params) do
    {
      url: {
        original: Faker::Lorem.characters(5)
      }
    }
  end

  let(:response_body) { JSON.parse(response.body) }

  describe '#shorten' do
    context 'when payload is valid' do
      it 'saves the record in the database' do
        expect do
          post :shorten, params: valid_url_params
        end.to change(Url, :count).by(1)
      end

      it 'creates and saves the shorten url' do
        post :shorten, params: valid_url_params

        expect(response_body['url']['shortened']).not_to be_empty
      end

      it 'responds with successful status' do
        post :shorten, params: valid_url_params

        expect(response).to have_http_status 200
      end
    end

    context 'when payload is invalid' do
      it 'does not saves the record in the database' do
        expect do
          post :shorten, params: invalid_url_params
        end.to change(Url, :count).by(0)
      end

      it 'responds with unsuccessful status' do
        post :shorten, params: invalid_url_params

        expect(response).to have_http_status 422
      end
    end
  end
end
