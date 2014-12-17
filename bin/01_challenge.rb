def parks_by_id(parks)
  result = {}

  parks.each do |park|
    result[park[:id]] = park
  end

  result
end

##################################################

require 'rspec/autorun'

RSpec.describe 'parks_by_id' do
  it 'returns a hash of parks by id, given an array of parks' do
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
      }
    ]

    expect(parks_by_id(parks)).to eq({
      546 => {
        :id=>546,
        :name=>"Kalahari Resorts",
        :city=>"Wisconsin Dells",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      547 => {
        :id=>547,
        :name=>"Little Amerricka",
        :city=>"Marshall",
        :state=>"Wisconsin",
        :country=>"United States"
      }
    })
  end

  it 'returns an empty hash when given an empty array' do
    expect(parks_by_id([])).to eq({})
  end
end
