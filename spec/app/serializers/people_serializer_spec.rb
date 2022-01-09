require 'spec_helper'

RSpec.describe PeopleSerializer do
  let(:params) { {first_name: 'Rhiannon', city: 'Atlanta', birthdate: Time.parse('30-4-1974') }}

  subject { described_class.new(params).to_s }
  describe '#to_s' do
    it { is_expected.to eq('Rhiannon, Atlanta, 4/30/1974') }
  end
end
