class AddCountToScrapers < ActiveRecord::Migration[6.0]
  def change
    add_column :scrapers, :count, :integer
  end
end
