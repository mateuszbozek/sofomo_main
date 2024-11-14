require 'rails_helper.rb'

RSpec.describe Location, type: :model do

    let(:geolocation) { Geolocation.create(ip:'0.0.0.0')}
    let(:location) { Location.new(geolocation_id: geolocation.id, capital: 'Warsaw' ) }

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

      context 'when capital is taken' do
        before do
          location.save
          geolocation_2 = Geolocation.create(ip: '198.168.0.1')
          @location_2 = Location.new(geolocation_id: geolocation_2.id, capital: 'Warsaw')
        end
  
        it 'new record is invalid' do
          expect(@location_2).not_to be_valid
        end
      end
    end
end
