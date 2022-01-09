# container for collection of persons
class People
  def initialize(people = [])
    @people = people
  end

  # @param field attribute of person
  def order(field)
    people.sort_by { |person| person.send(field) }
  end

  private

  attr_reader :people
end
