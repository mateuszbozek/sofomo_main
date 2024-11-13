class CreateGeolocations < ActiveRecord::Migration[7.2]
  def change
    create_table :geolocations do |t|
      t.timestamps
      t.string :ip
      t.string :protocol_ip
      t.string :continent_code
      t.string :continent_name
      t.string :country_code
      t.string :country_name
      t.string :region_code
      t.string :region_name
      t.string :city
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.string :msa
      t.string :dma
      t.float :radius
      t.string :ip_routing_type
      t.string :connection_type
    end
  end
end
