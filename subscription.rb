require 'stripe'
require 'yaml'
# require 'open-uri'
# require 'openssl'
# require 'json'
# require 'launchy'

###### Basic Config Information #####
config = YAML.load_file('config.yml')
client_url = 'https://api.stripe.com'
Stripe.api_key = config[:API_KEY]
# client_redirect_url = 'http://michaelburnley.com/wunderlistCSV.htm'
###### End Basic Config Information #####

# Stripe::Customer.create(
#   :description => "Customer for test@example.com",
#   :source => "tok_16RRpRC5mprcFNjzVmOcX2nl" # obtained with Stripe.js
# )

def CreateCustomer()
end

def UpdateCustomer(body)
	
end

allCustomers = Stripe::Customer.all(:limit => 3)
customerID = allCustomers['data'][0]['id']
cu = Stripe::Customer.retrieve(customerID)
cu.email = "test@test.com"
cu.save
puts allCustomers['data']