require 'yaml'
require 'pp'

rawdata = File.read('../data/amusement_parks.yml')
parkdata = YAML.load(rawdata)

def parks_by_id(parks)
  result = {}

  parks.each do |park|
    result[park[:id]] = park
  end

  result
end

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

pp parks_by_id(parkdata)
puts "##################################################"
pp parks_by_country(parkdata)
puts "##################################################"
pp parks_by_country_state(parkdata)
