require 'spec_helper'

RSpec.describe Person do
  let(:params) { { first_name: 'Rhiannon', city: 'LA', birthdate: '30-4-1974', last_name: 'Nolan' } }

  subject { described_class.new(params) }
  describe '#first_name' do
    it 'should be as per params' do
      expect(subject.first_name).to eq('Rhiannon')
    end
  end

  describe '#last_name' do
    it 'should be as per params' do
      expect(subject.last_name).to eq('Nolan')
    end
  end

  describe '#city' do
    it 'should be as per params' do
      expect(subject.city).to eq('Los Angeles')
    end
  end

  describe '#birthdate' do
    it 'should be as per params' do
      expect(subject.birthdate).to eq(Time.parse('30-4-1974'))
    end
  end
end
