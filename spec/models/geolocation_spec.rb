require 'rails_helper'

RSpec.describe Geolocation, type: :model do
  
  let(:geolocation) { Geolocation.new(ip: '0.0.0.0') }
  
  it 'new record valid' do
    expect(geolocation).to be_valid
  end

end
