class Sidekiq::Extensions::DelayedMailer
  sidekiq_options queue: 'mailer'
end
