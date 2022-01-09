require 'spec_helper'

RSpec.describe People do
  let(:p1) { Person.new({ first_name: 'Rhiannon', city: 'Atlanta', birthdate: '30-4-1974' }) }
  let(:p2) { Person.new({ first_name: 'Luke', city: 'LA', birthdate: '30-4-1979' }) }
  let(:people) { [p1, p2] }

  subject { described_class.new(people) }
  describe '#order' do
    it 'orders person by first name' do
      expect(subject.order(:first_name)).to eq([p2, p1])
    end
  end
end
