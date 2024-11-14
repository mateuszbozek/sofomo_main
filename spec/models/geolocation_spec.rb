require 'rails_helper'

RSpec.describe Geolocation, type: :model do
  
  let(:geolocation) { Geolocation.new(ip: '0.0.0.0') }
  
  describe 'validator' do
    context 'when attribute are valid' do
      it 'new record is valid' do
        expect(geolocation).to be_valid
      end    
    end

    context 'when ip is missing' do
      it 'new record is invalid' do
        geolocation.ip = nil
        expect(geolocation).not_to be_valid
      end
    end

    context 'when ip is in wrong format' do
      it 'new record is invalid' do
        geolocation.ip = '266.0.0.0'
        expect(geolocation).not_to be_valid
      end
    end

    context 'when ip contain letter in format' do
        it 'new record is invalid' do
          geolocation.ip = 'a.0.0.0'
          expect(geolocation).not_to be_valid
        end
      end

    context 'when ip is taken' do
      before do
        geolocation.save
      end

      it 'new record is invalid' do
        geolocation_2 = geolocation.dup
        expect(geolocation_2).not_to be_valid
      end
    end
  end

end
