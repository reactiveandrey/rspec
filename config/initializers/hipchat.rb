$hipchat = HipChat::Client.new(ENV['HIPCHAT_TOKEN'], :api_version => 'v2')

$slack = Slack::Notifier.new 'https://hooks.slack.com/services/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',
                             channel: 'lobster-notifications',
                             username: "sexygirl#{'-staging' unless Rails.env.production?}"

# https://hooks.slack.com/services/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

class InternalNotification
  
  def self.send(message)
    $slack.ping message
  rescue => e
    Rails.logger.fatal 'Failed to notify Lobster.'
    Rails.logger.fatal e.message
  end
  
end