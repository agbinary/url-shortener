# db/migrate/20180619232746_create_urls.rb
class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :original, null: false
      t.string :shortened, index: true

      t.timestamps
    end
  end
end
