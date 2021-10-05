class AddLastUpdateToScrapers < ActiveRecord::Migration[6.0]
  def change
    add_column :scrapers, :last_update, :integer
  end
end

