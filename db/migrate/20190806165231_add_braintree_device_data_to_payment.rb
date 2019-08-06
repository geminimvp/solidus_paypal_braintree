class AddBraintreeDeviceDataToPayment < ActiveRecord::Migration[5.1]
  def change
    change_table :spree_payments do |t|
      t.text :braintree_device_data
    end
  end
end
