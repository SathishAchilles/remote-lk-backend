class PeopleController
  SUPPORTED_FORMATS = {
    dollar: '$',
    percent: '%'
  }.freeze

  CITY_ABBREVIATIONS = {
    'LA' => 'Los Angeles',
    'NYC' => 'New York City'
  }.freeze

  def initialize(params)
    @params = params
  end

  def normalize
  end

  private

  attr_reader :params

  def normalize_params
    params.slice(:dollar_format, :percent_format, :order)
  end
end
