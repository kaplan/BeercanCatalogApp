class CreateBeercan < ActiveRecord::Migration
  def up
    create_table :beercans do |t|
      t.string :url
      t.string :caption
      t.string :brewery
      t.string :year_brewed
      t.timestamps
    end
  end

  def down
  end
end
