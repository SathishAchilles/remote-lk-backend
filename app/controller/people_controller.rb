# allows to render normalized Person data
class PeopleController
  def initialize(params)
    @params = params
    @table = build_table
  end

  def normalize
    @table.sort_by { |row| row[normalize_params[:order]] }.map { |row| PeopleSerializer.new(row).to_s }
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
        row[:birthdate] = Time.parse(row[:birthdate])
        row
      end
    end
  end
end
