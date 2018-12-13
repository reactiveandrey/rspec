require 'faraday'
require 'typhoeus'
require 'typhoeus/adapters/faraday'
require 'elasticsearch/model'

client = Elasticsearch::Client.new({
  log: true,
  host: Rails.configuration.elasticsearch_host
})

Elasticsearch::Model.client = client
Elasticsearch::Persistence.client = client
