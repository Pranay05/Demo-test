Rails.application.routes.draw do




        #custom routes for 
		#get 'signup', to: 'users#new', as: 'signup'
		post 'signup', to: 'users#create'
	    #get 'login', to: 'sessions#new', as:'signin'
	    post 'Login', to: 'sessions#create'
	    post 'ProfileUpdate/:user_id', to: 'users#update'





	    post 'EventCreate', to: 'events#create' 
	    get 'eventDetails/:event_id', to: 'events#show'
	    match 'eventUpadate/:event_id' => 'events#update', :via => 'post'
        match "eventDelete/:event_id" => "events#destroy", :via => 'post'
        
        #comment routes

        post 'events/:event_id/commentCreate', to: 'comments#create'
        post 'events/commentUpdate/:comment_id', to: 'comments#update'
        post 'events/commentDelete/:comment_id', to: 'comments#destroy'




	    match "events_like/:event_id" => "likes#create", :via => 'post'
	    match "events_like/:event_id" =>  "likes#index", :via => 'get'
	    match "comments_like/:comment_id" => "likes#create_comment", :via => 'post'
	    match "comments_like/:comment_id" => "likes#index_comment", :via => 'get'


	resources :users do 
		resources :events do
			resources :comments
		end
			
	end
	resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
