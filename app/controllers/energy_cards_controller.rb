class EnergyCardsController < ApplicationController
    before_action :set_energy_card, only: [:show, :edit, :update, :destroy]

  # GET /energy_cards
  # GET /energy_cards.json
  def index
    @energy_cards = EnergyCard.all
  end

  # GET /energy_cards/1
  # GET /energy_cards/1.json
  def show
  end

  # GET /energy_cards/new
  def new
    @energy_card = EnergyCard.new
  end

  # GET /energy_cards/1/edit
  def edit
  end

  # POST /energy_cards
  # POST /energy_cards.json
  def create
    @energy_card = EnergyCard.new(energy_card_params)

    respond_to do |format|
      if @energy_card.save
        format.html { redirect_to @energy_card, notice: 'Energy card was successfully created.' }
        format.json { render :show, status: :created, location: @energy_card }
      else
        format.html { render :new }
        format.json { render json: @energy_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /energy_cards/1
  # PATCH/PUT /energy_cards/1.json
  def update
    respond_to do |format|
      if @energy_card.update(energy_card_params)
        format.html { redirect_to @energy_card, notice: 'Energy card was successfully updated.' }
        format.json { render :show, status: :ok, location: @energy_card }
      else
        format.html { render :edit }
        format.json { render json: @energy_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /energy_cards/1
  # DELETE /energy_cards/1.json
  def destroy
    @energy_card.destroy
    respond_to do |format|
      format.html { redirect_to energy_cards_url, notice: 'Energy card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_energy_card
      @energy_card = EnergyCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def energy_card_params
      params[:energy_card][:element_type] = params[:energy_card][:element_type].to_i
      params.require(:energy_card).permit(:element_type, :quantity)
    end
end
