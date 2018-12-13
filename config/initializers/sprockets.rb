class RootUrlPreprocessor < Sprockets::Processor
  def evaluate(context, locals)
    logical_path = context.instance_variable_get(:@logical_path)
    return data unless logical_path == 'assets/stylesheets/application.css'
    rel = Pathname.new(logical_path).parent
    result = data.gsub /(?<=[:\s])url\(['"]?([^\s)]+\.[a-z]+)(\?\d+)?['"]?\)/i do |url|
      next url if URI.parse($1).absolute?
      new_path = rel.join Pathname.new($1)
      "url('#{new_path}#{$2}')"
    end
    result = result.split("\n").collect do |str|
      if str.include?("url(") && !str.include?("data:")
        str.gsub(" url(", " asset-url(")
      else
        str
      end
    end.join("\n") + "\n"
    result
  end
end

unless Rails.env.development?
  Rails.application.assets.register_preprocessor('text/css',
                                                 RootUrlPreprocessor)
end
