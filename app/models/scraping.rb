class Scraping
  include ActiveModel::Model

  attr_accessor :uri
  attr_accessor :mime_type
  attr_accessor :body

  attr_reader :entry

  def scrape
    @entry = Entry.new
    extractor = ChupaText::Extractor.new
    extractor.apply_configuration(ChupaText::Configuration.default)
    data = ChupaText::TextData.new(body)
    data.uri = uri
    data.mime_type = mime_type
    texts = []
    extractor.extract(data) do |extracted_data|
      texts << extracted_data.body
    end
    @entry._key = data.uri.to_s
    @entry.mime_type = data.mime_type
    @entry.body = texts.join("\n")
    @entry.size = @entry.body.bytesize
    @entry.save
  end
end
