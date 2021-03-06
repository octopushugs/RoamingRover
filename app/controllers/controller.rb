def new
end

def create
  # Amount in cents
   @amount = 500

   customer = Stripe::Customer.create(
     :email => 'example@stripe.com',
     :card => params[:stripeToken]
   )

   charge = Stripe::Charge.create(
     :customer => customer.id,
     :amount => @amount,
     :description => 'Rails Stripe customer',
     :currentcy => 'usd'
   )

   rescure Stripe::CardError => e
   flash[:error] = e.message
   redirect_to_charges_path
end

