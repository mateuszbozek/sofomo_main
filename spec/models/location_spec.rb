require 'rails_helper'

RSpec.describe Location, type: :model do

    let(:geolocation) { Geolocation.create(ip:'0.0.0.0')}
    let(:location) { Location.new(geolocation_id: geolocation.id, capital: 'Warsaw', calling_code: '1', geoname_id: 1 ) }

    describe 'validator' do
      context 'when attribute are valid' do
        it 'new record is valid' do
          expect(location).to be_valid
        end
      end

      context 'when geolocation is missing' do
        it 'new record is invalid' do
          location.geolocation_id = nil
          expect(location).not_to be_valid
        end
      end

      context 'when calling_code is missing' do
        it 'new record is invalid' do
          location.calling_code = nil
          expect(location).not_to be_valid
        end
      end

      context 'when geoname_id is missing' do
        it 'new record is invalid' do
          location.geoname_id = nil
          expect(location).not_to be_valid
        end
      end

    end
end
