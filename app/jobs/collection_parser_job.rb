class CollectionParserJob < ApplicationJob
  def perform(url)
    Rails.logger.info "Parsing collection: #{url}"
    Parser.parse_collection(url: url)
  end
end
