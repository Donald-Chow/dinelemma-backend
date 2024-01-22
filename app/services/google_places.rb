require 'json'

class GooglePlaces
  attr_reader :place_id

  def initialize(place_id)
    @place_id = place_id
  end

  def call
    fields = %i[formatted_address geometry name photo place_id type price_level rating user_ratings_total].join(",")
    key = Rails.application.credentials.dig(Rails.env.to_sym, :google_map_api_key)

    url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{@place_id}&fields=#{fields}&key=#{key}"
    response = RestClient.get(url)
    JSON.parse(response)['result']
  end

  def create_restaurant
    result = call
    params = clean_attributes(result) if result
    Restaurant.create(params)
  end

  private

  def clean_attributes(result)
    result['lng'] = result['geometry']['location']['lng']
    result['lat'] = result['geometry']['location']['lat']
    result['address'] = result['formatted_address']

    result.delete('formatted_address')
    result.delete('geometry')
    result
  end
end
