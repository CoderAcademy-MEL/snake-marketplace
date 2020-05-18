class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success 
    @listings = current_user.carts.last.listings
    Cart.create(completed: false, user_id: current_user.id)
  end 

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_ids = payment.metadata.listing_ids.split(",")
    listings = []
    listing_ids.each do |id|
      listing = Listing.find(id)
      listing.sold = true
      listing.save
    end 
    user = User.find(payment.metadata.user_id)
    cart = user.carts.last
    cart.completed = true
    cart.save
    # need to void the cart
    head 200
  end 

  def get_stripe_id
    @listings = current_user.carts.last.listings
    line_items = @listings.map do |listing|
      {
        name: listing.title,
        description: listing.description,
        amount: listing.deposit,
        currency: 'aud',
        quantity: 1,
      }
    end 
    listing_ids = @listings.pluck(:id).join(",")
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: line_items,
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          listing_ids: listing_ids
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingIds=#{listing_ids}",
      cancel_url: "#{root_url}listings"
    ).id
    render :json => {id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)}
  end
end
