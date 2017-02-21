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
    data = ChupaText::Data.new
    data.uri = uri
    data.mime_type = mime_type
    data.body = body
    data.size = body.bytesize
    texts = []
    size = 0
    extractor.extract(data) do |extracted_data|
      text = extracted_data.body
      texts << text
      size += text.bytesize
    end
    @entry._key = data.uri.to_s
    @entry.title = data[:title] || data[:subject] || @entry._key
    @entry.mime_type = data.mime_type
    @entry.texts = texts
    @entry.size = size
    @entry.save
  end
end
