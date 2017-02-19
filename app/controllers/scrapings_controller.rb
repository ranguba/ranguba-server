class ScrapingsController < ApplicationApiController
  # POST /scraping.json
  def create
    @scraping = Scraping.new(scraping_params)

    respond_to do |format|
      if @scraping.scrape
        @entry = @scraping.entry
        format.html { redirect_to @entry, notice: 'Scraped successfully.' }
        format.json { render "entries/show", status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @scraping.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def scraping_params
    params.permit(:uri, :mime_type, :body)
  end
end
