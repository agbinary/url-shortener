require 'rails_helper'

describe ShortUrlCreator do
  let(:url) do
    Url.create(
      original: Faker::Internet.url
    )
  end

  before { url }

  describe '#call' do
    describe 'shortened attribute' do
      context 'before pass trough the service' do
        it 'should be nil' do
          expect(url.shortened).to be_nil
        end
      end

      context 'after pass trough the service' do
        before do
          described_class.call(url)
        end

        it 'updates shortened url attribute with short url' do
          expect(url.shortened).not_to be_nil
        end
      end
    end
  end
end
