BeercanCatalogApp::Application.routes.draw do

  root :to => "Beercans#index"

  # Create
  get "beercans/new" => "Beercans#new", :as => "new_beercan"
  post "beercans/" => "Beercans#create", :as => "beercans"

  # Read
  get "beercans/" => "Beercans#index", :as => "beercans"
  get "beercans/:id" => "Beercans#show", :as => "beercan"

  # Update
  get "beercans/:id/edit" => "Beercans#edit", :as => "edit_beercan"
  put "beercans/:id" => "Beercans#update", :as => "beercan"

  # Delete
  delete "beercans/:id" => "Beercans#delete", :as => "beercan"

end
