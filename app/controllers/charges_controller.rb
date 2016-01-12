class ChargesController < ApplicationController
	

	def new
		
	end

	def create
	  # Amount in cents
	  @course = Course.find(params[:id])
	  @user_email = current_user.email
	  
	  begin

	  customer = Stripe::Customer.create(
	    :email => @user_email,
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => (@course.price*100).round,
	    :currency    => 'eur'
	  )

	  @subscription = current_user.subscriptions.create!(
	  	:course_id => @course.id,
	  	:stripe_id => customer.id,
	  	:charge_id => charge.id
	  	)

	  redirect_to :back, notice: 'Félicitations, vous avez dès maintenant accès à vie à ce cours !'

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to course_path(@course)
	end
end


end
