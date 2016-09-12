require "rails_helper"

RSpec.describe Pokemon::Attack, type: :model do

  describe 'Presence Validations' do
    let(:errors) { subject.errors}
    let(:setup)  {}

    before do
      setup
      subject.validate
    end

    context 'When name is required' do
      it 'errors should has :blank for :name' do
        expect(errors.added? :name, :blank).to be_truthy
      end
    end

    context 'When name is filled' do
      let(:setup) {subject.name = 'Some Atack'}
      it 'errors should not has :blank for :name' do
        expect(errors.added? :name, :blank). to be_falsey
      end
    end

  end

  describe 'Default values' do

    it ":energy_quantity should be 0" do
      expect(subject.energy_quantity).to be == 0
    end

    it ":damage_quantity should be 0" do
      expect(subject.damage_quantity).to be == 0
    end

    it ":multiplied_attack should be 1" do
      expect(subject.multiplied_attack).to be == 1
    end

    it ":name should be nil" do
      expect(subject.name).to be_nil
    end
  end


end
