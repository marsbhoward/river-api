class ScrapersController < ApplicationController
    def index
        render json: Scraper.first
    end

end
