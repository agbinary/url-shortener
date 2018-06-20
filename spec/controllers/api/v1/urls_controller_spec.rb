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

  describe '#shorten' do
    context 'when payload is valid' do
      it 'saves the record in the database' do
        expect do
          post :shorten, params: valid_url_params
        end.to change(Url, :count).by(1)
      end

      it 'creates and saves the shorten url' do
        post :shorten, params: valid_url_params

        response_body = JSON.parse(response.body)

        expect(response_body['url']['shortened']).not_to be_empty
      end
    end

    context 'when payload is invalid' do
      it 'does not saves the record in the database' do
        expect do
          post :shorten, params: invalid_url_params
        end.to change(Url, :count).by(0)
      end
    end
  end
end
