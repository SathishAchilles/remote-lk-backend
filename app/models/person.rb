require 'time'
# Acts as a container to hold people record
class Person
  def initialize(**kwargs)
    @first_name = kwargs[:first_name]
    @last_name = kwargs[:last_name]
    self.city = kwargs[:city]
    self.birthdate = kwargs[:birthdate]
  end

  attr_reader :first_name, :last_name, :city, :birthdate

  private

  def birthdate=(birthdate)
    @birthdate = Time.parse(birthdate)
  end

  def city=(city)
    @city = if APPLICATION_CONFIGS[:city_abbreviations].key?(city)
              APPLICATION_CONFIGS[:city_abbreviations][city]
            else
              city
            end
  end
end
