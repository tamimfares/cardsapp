class CardsController < ApplicationController

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
    @card = Card.find(params[:id])
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to(@card, :flash => :success)
    else
      flash_now!(:error)
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to(cards_path, :flash => :warning)
  end

  private
    def card_params
      params.require(:card).permit(:title, :content)
    end

end
