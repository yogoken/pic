# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Amazon::Ecs.options = {
  associate_tag: ENV['AMAZON_ASSOCIATE_ID'],
  AWS_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  AWS_secret_access_key_id: ENV['AWS_SECRET_ACCESS_KEY_ID']
}
