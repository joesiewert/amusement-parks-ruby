def parks_by_country_state(parks)
  result = {}

  parks.each do |park|
    key = "#{park[:state]}, #{park[:country]}"
    if result.has_key?(key)
      result[key] << park
    else
      result[key] = [park]
    end
  end

  result
end

##################################################

require 'rspec/autorun'

RSpec.describe 'parks_by_country_state' do
  it 'returns a hash of parks by country and state, given an array of parks' do
    parks = [
      {
        :id=>3,
        :name=>"Galaxyland",
        :city=>"Edmonton",
        :state=>"Alberta",
        :country=>"Canada"
      },
      {
        :id=>4,
        :name=>"Heratage Park",
        :city=>"Calgary",
        :state=>"Alberta",
        :country=>"Canada"
      },
      {
        :id=>6,
        :name=>"Playland (Vancouver)",
        :city=>"Vancouver",
        :state=>"British Columbia",
        :country=>"Canada"
      },
      {
        :id=>8,
        :name=>"Crystal Palace Amusement Park",
        :city=>"Dieppe",
        :state=>"New Brunswick",
        :country=>"Canada"
      }
    ]

    expect(parks_by_country_state(parks)).to eq({
      "Alberta, Canada" => [
        {
          :id => 3,
          :name => "Galaxyland",
          :city => "Edmonton",
          :state => "Alberta",
          :country => "Canada"
        },
        {
          :id => 4,
          :name => "Heratage Park",
          :city => "Calgary",
          :state => "Alberta",
          :country => "Canada"
        },
      ],
      "British Columbia, Canada" => [
        {
          :id => 6,
          :name => "Playland (Vancouver)",
          :city => "Vancouver",
          :state => "British Columbia",
          :country => "Canada"
        },
      ],
      "New Brunswick, Canada" => [
        {
          :id => 8,
          :name => "Crystal Palace Amusement Park",
          :city => "Dieppe",
          :state => "New Brunswick",
          :country => "Canada"
        }
      ]
    })
  end

  it 'returns an empty hash when given an empty array' do
    expect(parks_by_country_state([])).to eq({})
  end
end
