# allows to render normalized Person data
class PeopleController
  def initialize(params)
    @params = params
    @people = populate_people_table
  end

  def normalize
    @table.sort_by { |row| row[normalize_params[:order]] }.map { |row| PeopleSerializer.new(row).to_s }
  end

  private

  attr_reader :params, :people

  def normalize_params
    params.slice(:dollar_format, :percent_format, :order)
  end

  def populate_people_table
    People.new(PeopleParser.call(normalize_params))
  end
end
