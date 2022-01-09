# allows to render normalized People data
require 'csv'
require 'time'

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
    @table = build_table
  end

  def normalize
    @table.sort_by { |row| row[normalize_params[:order]].strip }
          .map { |row| row.slice(:first_name, :city, :birthdate).values.join(', ') }
  end

  private

  attr_reader :params, :table

  def normalize_params
    params.slice(:dollar_format, :percent_format, :order)
  end

  def build_table
    SUPPORTED_FORMATS.flat_map do |format_key, delimiter|
      CSV.parse(normalize_params["#{format_key}_format".to_sym],
                col_sep: delimiter,
                headers: true,
                header_converters: :symbol)
         .map do |row|
        row = row.to_hash
        row.transform_values!(&:strip)
        if CITY_ABBREVIATIONS.key?(row[:city])
          row[:city] =
            CITY_ABBREVIATIONS[row[:city]]
        end
        row[:birthdate] = Time.parse(row[:birthdate]).strftime('%-m/%-d/%Y')
        row
      end
    end
  end
end
