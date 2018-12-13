require 'stripe'

if ENV['STRIPE_SECRET_KEY'].blank?
  Rails.logger.fatal 'Environment variable STRIPE_SECRET_KEY is blank.'
end
if ENV['STRIPE_PUBLISHABLE_KEY'].blank?
  Rails.logger.fatal 'Environment variable STRIPE_PUBLISHABLE_KEY is blank.'
end
if ENV['STRIPE_WEBHOOK_SECRET'].blank?
  Rails.logger.fatal 'Environment variable STRIPE_WEBHOOK_SECRET is blank.'
end

Stripe.api_key = ENV['STRIPE_SECRET_KEY']

StripeEvent.authentication_secret = ENV['STRIPE_WEBHOOK_SECRET']
StripeEvent.configure do |events|
  events.subscribe 'invoice.' do |event|
    SubscriptionService.new.handle_stripe_event(event)
  end
  events.subscribe 'customer.subscription.' do |event|
    SubscriptionService.new.handle_stripe_event(event)
  end
end
