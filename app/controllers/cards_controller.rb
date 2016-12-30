class CardsController < ApplicationController

  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all.order("created_at DESC")
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to(@card, :flash => :success)
    else
      flash_now!(:error)
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to(@card, :flash => :success)
    else
      flash_now!(:error)
      render 'edit'
    end
  end

  def destroy
    @card.destroy
    redirect_to(cards_path, :flash => :warning)
  end

  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:title, :content)
    end

end
