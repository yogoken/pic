# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Amazon::Ecs.configure do |options|
  options[:AWS_access_key_id] = ENV["AWS_ACCESS_KEY_ID"]
  options[:AWS_secret_key] = ENV["AWS_SECRET_ACCESS_KEY_ID"]
  options[:associate_tag] = ENV["AMAZON_ASSOCIATE_ID"]
end