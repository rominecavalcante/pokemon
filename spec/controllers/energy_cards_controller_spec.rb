require "rails_helper"

RSpec.describe EnergyCardsController, type: :controller do

  describe '#index' do
    before  {get :index}

    it 'Should render index template' do
      expect(response).to render_template(:index)
    end

    it 'Should assigns :energy_cards as EnergyCard::ActiveRecord_Relation' do
      expect(assigns :energy_cards).to be_an EnergyCard::ActiveRecord_Relation
    end
  end

  describe '#show' do
    # let(:energy_card) { EnergyCard.new }
    #
    # before do
    #   allow(EnergyCard).to receive(:find).with("1").and_return energy_card
    #   get :show, id: 1
    # end

    let(:energy_card) { EnergyCard.create(element_type: :water) }

    before do
      get :show, id: energy_card.id
    end

    it "Should render show template" do
      expect(response).to render_template(:show)
    end

    it "Shoudl assigns :energy_card as EnergyCard" do
      expect(assigns :energy_card).to be_an EnergyCard
    end

  end

end
