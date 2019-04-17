class CreditCardsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create]

  def new
    @creditcard = CreditCard.new
    gon.key = PAYJP_PUBLIC_KEY
  end

  def create
    Payjp.api_key = PAYJP_SECRET_KEY
    customer = Payjp::Customer.create(card: params[:card_id])
    card = CreditCard.new(card_id: params[:card_id],customer_id: customer.id,user_id: current_user.id)
    if card.save
      redirect_to root_path
    else
      redirect_to new_credit_card_path
    end
  end

end
