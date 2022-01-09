require 'csv'
require 'time'

# Parses Person data in different formats
class PeopleParser
  class << self
    def call(params)
      new(params).call
    end
  end

  def initialize(params)
    @params = params
    @supported_formats = APPLICATION_CONFIGS[:supported_formats]
  end

  def call
    @supported_formats.flat_map do |format_key, delimiter|
      CSV.parse(params["#{format_key}_format".to_sym],
                col_sep: delimiter,
                headers: true,
                header_converters: :symbol).map do |row|
        format_row(row)
      end
    end
  end

  private

  attr_reader :params, :city_abbreviations, :supported_formats

  def format_row(row)
    row = row.to_hash
    row.transform_values!(&:strip)
    Person.new(row)
  end
end
