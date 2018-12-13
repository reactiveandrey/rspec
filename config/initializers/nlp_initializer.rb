if ENV['USE_NLP']
  StanfordCoreNLP.use :english
  StanfordCoreNLP.model_files = {}
  StanfordCoreNLP.default_jars = [
    'joda-time.jar',
    'xom.jar',
    'stanford-corenlp-3.5.0.jar',
    'stanford-corenlp-3.5.0-models.jar',
    'jollyday.jar',
    'bridge.jar'
  ]
  StanfordCoreNLP.jar_path = ENV['STANFORD_JAR_PATH'] || File.join(Rails.root.to_s, 'stanford-bin/')
  StanfordCoreNLP.model_path = ENV['STANFORD_MODEL_PATH'] || File.join(Rails.root.to_s, 'stanford-bin/')
  NLP.pipeline
end
