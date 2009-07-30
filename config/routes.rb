ActionController::Routing::Routes.draw do |map|
  map.connect '/', :controller => 'things', :action => 'index'
  map.connect '/progress', :controller => 'things', :action => 'progress'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
