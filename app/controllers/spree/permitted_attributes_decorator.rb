Spree::PermittedAttributes.module_eval do
  #TIHI
  class_variable_set('@@payment_attributes', class_variable_get('@@payment_attributes') + [:braintree_device_data])
end
