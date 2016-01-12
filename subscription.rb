require 'stripe'
require 'yaml'
require 'csv'
# require 'open-uri'
# require 'openssl'
# require 'json'
# require 'launchy'

###### Basic Config Information #####
config = YAML.load_file('config.yml')
client_url = 'https://api.stripe.com'
Stripe.api_key = config[:API_KEY]
###### End Basic Config Information #####

# Stripe::Customer.create(
#   :description => "Customer for test@example.com",
#   :source => "tok_16RRpRC5mprcFNjzVmOcX2nl" # obtained with Stripe.js
# )

stripeCustomer = Stripe::Customer.all(:limit => 3)
ALLCUSTOMERS = stripeCustomer['data']

def createCustomer()
end

def exportAllCustomers()
	File.open("export.csv", 'w')
	
end

def updateCustomer(body)
end

def findCustomer(email)
	selectedCustomer = ALLCUSTOMERS.select {|x| x['email'] == email}
	customerID = selectedCustomer[0]['id']
	return customerID
end

selectCustomer = findCustomer("test@test.com")
puts selectCustomer


# customerID = allCustomers['data'][0]['id']
# cu = Stripe::Customer.retrieve(customerID)
# cu.email = "test@test.com"
# cu.save
# puts allCustomers['data']