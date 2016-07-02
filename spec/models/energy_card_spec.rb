require 'rails_helper'

RSpec.describe EnergyCard, type: :model do

  describe 'Presence Validations'  do
    let(:errors) { subject.errors }
    let(:setup)  { }

    before do
      setup
      subject.validate
    end

    context 'When element_type is required' do
      it 'errors should has :blank for :element_type' do
        expect(errors.added? :element_type, :blank).to be_truthy
      end
    end

    context 'When element_type is filled' do
      let(:setup) { subject.element_type = :water }

      it 'errors should not has :blank for :element_type' do
        expect(errors.added? :element_type, :blank).to be_falsey
      end
    end
  end

  describe 'EnergyCard Creation' do
    let(:setup) { subject.element_type = :fire }

    before do
      setup
      subject.save
      subject.reload
    end

    context 'When no pass a quantity' do
      it 'Quantity should be equal to 1' do
        expect(subject.quantity).to be == 1
      end
    end

    context 'When pass a quantity' do
      let(:setup) do
        subject.element_type = :grass
        subject.quantity = 2
      end

      it 'Quantity should be equal to 2' do
        expect(subject.quantity).to be == 2
      end
    end
  end

end
