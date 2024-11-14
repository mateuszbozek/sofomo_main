require 'rails_helper'

RSpec.describe Language, type: :model do

    let(:geolocation) { Geolocation.create(ip:'0.0.0.0')}
    let(:location) { Location.create(geolocation_id: geolocation.id, capital: 'Warsaw', calling_code: '1', geoname_id: 1 ) }
    let(:language) { Language.new(location_id: location.id, native: 'Polish', code: 'pl', name: 'Polski') }

    describe 'validator' do
      context 'when attribute are valid' do
        it 'new record is valid' do
          expect(language).to be_valid
        end
      end

      context 'when location_id is missing' do
        it 'new record is invalid' do
          language.location_id = nil
          expect(language).not_to be_valid
        end
      end

      context 'when native is missing' do
        it 'new record is invalid' do
          language.native = nil
          expect(language).not_to be_valid
        end
      end

      context 'when native is missing' do
        it 'new record is invalid' do
          language.code = nil
          expect(language).not_to be_valid
        end
      end

      context 'when name is missing' do
        it 'new record is invalid' do
          language.name = nil
          expect(language).not_to be_valid
        end
      end

    end
end
