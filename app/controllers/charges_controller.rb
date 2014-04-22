class ChargesController < ApplicationController

  def new
  end
  
  def create
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Plan.create(
      :amount => 2000,
      :interval => 'month',
      :name => 'Amazing Gold Plan',
      :currency => 'gbp',
      :id => 'gold'
    )
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end

end
