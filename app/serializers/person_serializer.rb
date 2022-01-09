# serializes person
class PersonSerializer
  def initialize(people)
    @people = people
  end

  def to_s
    "#{people.first_name}, #{people.city}, #{people.birthdate.strftime('%-m/%-d/%Y')}"
  end

  private

  attr_reader :people
end
