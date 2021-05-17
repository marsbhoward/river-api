module ScraperUtilities
    extend ActiveSupport::Concern



    def add
        self.update(:count => self.count + 1)
    end

    def reset
        self.update(:count => 0)
    end        
  
end