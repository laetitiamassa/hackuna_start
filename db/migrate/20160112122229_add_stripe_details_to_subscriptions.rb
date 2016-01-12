class AddStripeDetailsToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :stripe_id, :string
    add_column :subscriptions, :charge_id, :string
  end
end
