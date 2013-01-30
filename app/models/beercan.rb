class Beercan < ActiveRecord::Base
  attr_accessible :url, :caption, :brewery, :year_brewed
end
