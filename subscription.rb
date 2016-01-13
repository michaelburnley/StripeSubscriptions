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
stripeCustomer = Stripe::Customer.all #(:limit => 3)
stripePlans = Stripe::Plan.all #(:limit => 3)
ALLCUSTOMERS = stripeCustomer['data']
ALLPLANS = stripePlans['data']
###### End Basic Config Information #####

def findCustomerID(criteria, value)
	selectedCustomer = ALLCUSTOMERS.select {|x| x["#{criteria}"] == value}
	return selectedCustomer[0]['id']
end

def createCustomer(email, coupon, plan)
	#Stripe::Customer.create(
	#	:email =>	email
	#	:coupon =>	coupon
	#	:plan =>	plan
	#	)
end

def createSubscription(customerID, planID)
	cu = Stripe::Customer.retrieve(customerID)
	cu.subscriptions.create({:plan => planID})
	cu.save
end

selectCustomer = findCustomerID("email","test@test.com")
puts ALLPLANS[0]
puts selectCustomer


# Stripe::Customer.create(
#   :description => "Customer for test@example.com",
#   :source => "tok_16RRpRC5mprcFNjzVmOcX2nl" # obtained with Stripe.js
# )

# customerID = allCustomers['data'][0]['id']
# cu = Stripe::Customer.retrieve(customerID)
# cu.email = "test@test.com"
# cu.save
# puts allCustomers['data']