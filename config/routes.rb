Maxpoint::Application.routes.draw do
  require_relative "../vendor/gems/cms/lib/cms/engine"

  get '/search' => "search#index"
  mount Cms::Engine => '/vendor/gems/cms'
end
