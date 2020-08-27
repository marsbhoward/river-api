class TitleToSlug < ActiveRecord::Migration[6.0]
  def self.up
  	rename_column :movies,  :title, :slug 
  end
end
