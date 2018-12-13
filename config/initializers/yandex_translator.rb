Yandex::Translator.api_key = if Rails.env.production?
  ENV['YANDEX_TRANSLATOR_KEY']
else
  'trnsl.1.1.20160419T205738Z.5c505011981d9225.4497702faa07f3bddf876351d0f1911b66c8dc96'
end
