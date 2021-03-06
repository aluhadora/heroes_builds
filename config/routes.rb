HeroesBuilds::Application.routes.draw do

  root :to => 'builds#index'

  get 'builds' => "builds#showtext"
  get 'builds/:name' => 'builds#show'
  get 'buildlist' => 'builds#index'
  get 'destroybuild/:name' => 'builds#destroy'
  get 'addbuild/:name/:url' => 'builds#create', :constraints => { :url => /.*/ }
  post 'builds' => 'builds#createnew'
  
  match '/web_new', to: 'builds#web_new'

end
