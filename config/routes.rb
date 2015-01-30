HeroesBuilds::Application.routes.draw do

  root :to => 'builds#index'
  get 'builds' => "builds#showtext"
  get 'builds/:name' => 'builds#show'
  get 'buildlist' => 'builds#index'
  get 'destroybuild/:name' => 'builds#destroy'
  get 'addbuild/:name/*url' => 'builds#create'
  # get 'addbuild/:name/:url' => 'builds#create', :constraints => { :url => /.*/ }


end
