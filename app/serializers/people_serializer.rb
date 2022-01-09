class PeopleSerializer
  def initialize(**kwargs)
    @first_name = kwargs[:first_name]
    @city = kwargs[:city]
    @birthdate = kwargs[:birthdate]
  end

  def to_s
    "#{first_name}, #{city}, #{birthdate.strftime('%-m/%-d/%Y')}"
  end

  private

  attr_reader :first_name, :city, :birthdate
end
