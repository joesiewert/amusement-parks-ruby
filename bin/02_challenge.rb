def parks_by_country(parks)
  result = {}

  parks.each do |park|
    if result.has_key?(park[:country])
      result[park[:country]] << park
    else
      result[park[:country]] = [park]
    end
  end

  result
end

##################################################

require 'rspec/autorun'

RSpec.describe 'parks_by_country' do
  it 'returns a hash of parks by country, given an array of parks' do
    parks = [
      {
        :id=>546,
        :name=>"Kalahari Resorts",
        :city=>"Wisconsin Dells",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>547,
        :name=>"Little Amerricka",
        :city=>"Marshall",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>2,
        :name=>"Calaway Park",
        :city=>"Calgary",
        :state=>"Alberta",
        :country=>"Canada"
      }
    ]

    expect(parks_by_country(parks)).to eq({
      "Canada" => [
        {
          :id=>2,
          :name=>"Calaway Park",
          :city=>"Calgary",
          :state=>"Alberta",
          :country=>"Canada"
        }
      ],
      "United States" => [
        {
          :id=>546,
          :name=>"Kalahari Resorts",
          :city=>"Wisconsin Dells",
          :state=>"Wisconsin",
          :country=>"United States"
        },
        {
          :id=>547,
          :name=>"Little Amerricka",
          :city=>"Marshall",
          :state=>"Wisconsin",
          :country=>"United States"
        }
      ]
    })
  end

  it 'returns an empty hash when given an empty array' do
    expect(parks_by_country([])).to eq({})
  end
end
