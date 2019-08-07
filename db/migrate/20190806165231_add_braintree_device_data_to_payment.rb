class AddBraintreeDeviceDataToPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_payments, :braintree_device_data, :text
  end
end
