require 'rails_helper'

describe UrlsController, type: :controller do
  let(:url) { create(:url) }

  before { url }

  describe '#expand' do
    it 'should redirect to expand link' do
      get :expand, params: { shortened_url: url.shortened }

      expect(response).to redirect_to url.original
    end
  end
end
