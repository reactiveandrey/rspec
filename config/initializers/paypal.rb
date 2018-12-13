if Rails.env.production?
  PAYPAL_LOBSTER_EMAIL = "payment@ilobster.it"
  PAYPAL_IPN_VALIDATION_URL = "https://www.paypal.com/cgi-bin/webscr?cmd=_notify-validate"
else
  PAYPAL_LOBSTER_EMAIL = "lobstermoney@ilobster.it"
  PAYPAL_IPN_VALIDATION_URL = "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_notify-validate"
end

PAYPAL_RETURN_URL = "#{HOST_URL}/purchases/paypal_success"
PAYPAL_CANCEL_URL = "#{HOST_URL}/purchases/paypal_cancel"
PAYPAL_NOTIFY_URL = "#{HOST_URL}/purchases/seller_ipn_notification"
PAYPAL_LOBSTER_NOTIFY_URL = "#{HOST_URL}/purchases/lobster_ipn_notification"
PAYPAL_ERROR_NOTIFIED_EMAILS = %w(andrewd@ilobster.it max@schulzepartners.com)
MAX_MASSPAY_RECEPIENTS_COUNT = 250

# PayPal SDK.
PayPal::SDK.load("config/paypal.yml", Rails.env)
PayPal::SDK.logger = Rails.logger
