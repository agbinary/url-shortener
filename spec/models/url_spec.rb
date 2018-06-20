require 'rails_helper'

RSpec.describe Url, type: :model do
  subject { build(:url) }

  it 'has a valid factory' do
    expect(build(:url)).to be_valid
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:original) }
  end

  describe 'url validator' do
    context 'when url is valid' do
      let(:url) do
        described_class.new(
          original: Faker::Internet.url
        )
      end

      it 'saves the record in the database' do
        expect { url.save }.to change(Url, :count).by(1)
      end
    end

    context 'when url is invalid' do
      let(:url) do
        described_class.new(
          original: Faker::Lorem.characters(5)
        )
      end

      it 'does not saves the record in the database' do
        expect { url.save }.to change(Url, :count).by(0)
      end
    end
  end
end
