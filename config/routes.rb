require 'sidekiq/web'
Ilobster::Application.routes.draw do
  get '/404' => 'pages#error404'
  get '/500' => 'pages#error500'

  mount PublicApi => '/dev'

  devise_for :users, controllers: {
    confirmations: 'confirmations',
    registrations: 'registrations',
    passwords: 'passwords',
    sessions: 'sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get '/users/sign_out' => 'sessions#destroy'
    get '/users/auth/facebook_release' => 'users/omniauth_callbacks#facebook_release'
    get '/users/auth/vimeo/callback' => 'users/omniauth_callbacks#vimeo'
    get '/users/auth/verizon/callback' => 'users/omniauth_callbacks#verizon'
    get '/users/auth/dropbox_oauth2/callback' => 'users/omniauth_callbacks#dropbox_oauth2'
    post '/users/auth/vimeo/callback' => 'users/omniauth_callbacks#vimeo'
  end

  get 'verizon_sign_up' => 'promo_pages#verizon_sign_up'


  get 'users/auth/google_photo' => redirect('users/auth/youtube?provider=google_photo')

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      match 'user', to: 'users#show', via: [:options]
      match 'cart', to: 'users#cart',  via: [:options, :get]
      match 'media_types', to: 'media_types#index', via: [:options]
      match 'sources', to: 'sources#index', via: [:options]

      match 'subscription', to: 'subscriptions#current_user_subscription', via: [:get, :options]

      resource :user, only: [:show]
      resources :sources, only: [:index]
      resources :suggestions, only: [] do
        collection do
          get :users
          get :tags
        end
      end
      resources :media_types, only: [:index]
      resources :collections, only: [:index, :create]
      resources :unprocessed_images, only: [:index, :destroy] do
        post :callback, on: :collection
      end
      resources :images_without_colors, only: [:index] do
        post :set_colors, on: :collection
      end
      resources :images_without_faces, only: [:index] do
        post :set_faces, on: :collection
      end
      resources :images_without_neural_descriptions, only: [:index] do
        post :set_neural_descriptions, on: :collection
      end
      resources :images_without_blur_values, only: [:index] do
        post :set_blur_values, on: :collection
      end
      resources :descriptors, only: [:index] do
        post :set_descriptors, on: :collection
      end
      resources :tesseract, only: [:index] do
        post :set_symbols_counts, on: :collection
      end

      match 'contents/:id/price', to: 'contents#price', via: [:options]
      resources :contents, only: [] do
        member do
          match 'vote', to: 'contents#vote', via: [:options]
          match 'add_to_collection', to: 'contents#add_to_collection', via: [:options]
          match 'remove_from_collection', to: 'contents#remove_from_collection', via: [:options]
          get :price
          get :vote
          put :add_to_collection
          delete :remove_from_collection
        end
      end

      resources :carts, only: [] do
        member do
          match 'add_to_cart', to: 'carts#add_to_cart', via: [:options]
          match 'remove_from_cart', to: 'carts#remove_from_cart', via: [:options]
          post :add_to_cart
          delete :remove_from_cart
        end
      end

      namespace :search do
        match 'requests', to: 'requests#create', via: [:options]
        match 'requests/:id', to: 'requests#show', via: [:options]
        match 'requests/count', to: 'requests#count', via: [:options]

        resources :requests, only: [:create, :show] do
          post :count, on: :collection
        end
      end
    end
  end

  resources :challenges, only: [:index, :show]
  resources :collections, only: [:show]
  resources :public_editors, only: [:edit, :update, :index, :create] do
    post :approve, on: :member
    post :search_request_generation, on: :member
  end

  post '/collections/create_from_user/:user_id' => 'collections#create_from_user', as: :create_collection_from_user

  resources :content, only: [] do
    resources :model_releases, only: [:new, :create] do
      collection do
        post :request_release
      end
    end
    resources :purchases, controller: 'content/purchases', only: [:create, :show] do
      collection do
        get :create
      end
    end
    member do
      get :price
      put :block, to: 'content#toggle_block'
      put :manage_tags
      put :manage_fields
      put :reprocess, to: 'content#reprocess'
      get :similar
      get :my_content_sidebar
      post :my_content_add_tag
      post :my_content_remove_tag
      put :add_custom_face
      put :remove_custom_face
    end
    collection do
      post :block
      post :mark_normal
    end
  end

  resources :shazura_actions, only: :index

  get '/cart/checkout' => 'content/purchases#create_bulk', as: :cart_checkout
  get '/cart/:id/finish' => 'content/purchases#cart_finish', as: :cart_finish
  get '/cart/:id/success' => 'content/purchases#paypal_bulk_success', as: :cart_success
  post '/cart/:id/success' => 'content/purchases#paypal_bulk_success'
  get '/cart/:id/cancel' => 'content/purchases#paypal_bulk_cancel', as: :cart_cancel
  get '/cart/:id/cancel' => 'content/purchases#paypal_bulk_cancel'
  get '/cart/:id/download' => 'cart#download', as: :cart_download
  get '/cart/refresh' => 'cart#refresh', as: :cart_refresh

  resources :purchases, controller: 'content/purchases', only: [:index] do
    member do
      get :paypal_success
      get :paypal_cancel
      post :paypal_success
      post :paypal_cancel
      post :seller_ipn_notification
      post :lobster_ipn_notification
    end
  end

  resources :buy_requests, only: [:create]
  resources :contact_requests, only: [:create]
  resources :leads, only: [:create]
  resources :lightboxes do
    member do
      get :add_item
      get :remove_item
      post :add_to_cart
    end
  end
  resources :deposits, only: [:create]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  get 'about' => 'pages#about', as: :about
  get 'sell-content' => 'pages#sell_content', as: 'sell_content'
  get 'terms' => 'pages#terms'
  get 'privacy' => 'pages#privacy'
  get 'cookies' => 'pages#cookies'
  get 'accept_cookies' => 'user#accept_cookies'
  get 'sorry' => 'pages#sorry' # country is not supported
  get 'team' => 'pages#team'
  get 'popular' => 'pages#popular_searches'
  get 'playground' => 'pages#playground'
  get 'unavailable' => 'pages#unavailable'
  get 'unsupported' => 'pages#unsupported' # unsupported browser
  get 'profile' => redirect("/profile/edit")
  get 'profile/edit' => 'user#edit_profile', as: :edit_profile
  get 'u/:user_id/fav' => 'my_content#favourites', as: :public_favourites
  get 'u/:id(/:provider)' => 'user#public', as: :public_profile
  get 'u/:user_id/:provider/content' => 'content#by_user'
  patch 'profile'  => 'user#update', as: :update_profile
  patch 'profile/upload_signature' => 'user#upload_signature', as: :upload_signature
  patch 'profile/password'  => 'user#update_password', as: :update_password
  get 'profile/password/edit' => 'user#edit_password', as: :edit_password
  match 'user/update' => 'user#update', via: [:patch, :put, :post, :get]
  get 'user/validate_password' => 'user#validate_password'
  match 'user/resend_confirmation_letter' => 'user#resend_confirmation_letter', via: [:patch, :put, :post, :get]
  get 'user/check_email_is_free' => 'user#check_email_is_free'
  delete 'user/avatar' => 'user#delete_avatar'
  match 'user/create_instagram_user' => 'user#create_instagram_user', via: [:patch, :put, :post, :get]
  match 'user/unsubscribe' => 'user#unsubscribe_user', via: [:patch, :put, :post, :get]
  match 'delete_account' => 'user#delete_account', via: [:patch, :put, :post, :get]
  match 'content/subscribe' => 'content#subscribe', via: [:patch, :put, :post, :get]
  get 'content/newcontent' => 'content#newcontent'
  match '/report_photo' => 'content#report_photo', via: [:patch, :put, :post, :get]
  get 'maintenance' => 'pages#maintenance'
  get 'marketplace' => 'content#marketplace', as: 'marketplace', via: [:get, :patch, :put, :post, :get]
  get 'marketplace_gallery' => 'content#marketplace_gallery'
  get 'explore' => 'content#explore'
  get '/posts/view/:id' => redirect('https://blog.lobster.media')
  get '/content/download/:id' => 'content#v2_download', as: :download_content
  match '/content/increment_views/:id' => 'content#increment_views', via: [:patch, :put, :post, :get]
  post '/content/toggle_for_sale/:id' => 'content#toggle_for_sale', as: 'content_toggle_for_sale'
  match 'settings/update', to: 'settings#update', via: [:patch, :put, :post, :get]
  get 'topsold' => 'content#topsold'
  get 'featured' => 'content#featured'
  get 'nearest' => 'content#nearest'
  get 'apps' => 'user#apps'
  match 'create_payment_parallel' => 'content#create_payment_parallel', via: [:patch, :put, :post, :get]
  match 'ipn_notification' => 'content#ipn_notification', via: [:patch, :put, :post, :get]
  match 'lobster_ipn_notification' => 'content#lobster_ipn_notification', via: [:patch, :put, :post, :get]
  match 'user/facebook' => 'user#facebook', via: [:patch, :put, :post, :get]

  post '/tokens/toggle_content_for_sale/:id' => 'tokens#toggle_content_for_sale'
  post '/tokens/toggle_all_content/:id' => 'tokens#toggle_all_content'
  match 'tokens/delete/:id' => 'tokens#delete', via: [:patch, :put, :post, :get, :delete]
  get '/tokens/:id/progress' => 'tokens#progress'

  match 'users/paypal_comfirm/:token' => 'user#paypal_confirm', via: [:patch, :put, :post, :get]
  get 'beta_users/new' => 'beta_users#new'
  get 'content/media/:id' => 'content#media'
  get 'suggestions/:q' => 'content#suggestions'

  get 'transactions' => 'content/purchases#index'

  # My Content Page (Gallery)
  get 'profile/my-content'            => 'my_content#gallery', as: 'my_content'
  match 'profile/my-content/:provider'  => 'my_content#gallery', as: 'seller', via: [:patch, :put, :post, :get]
  get 'profile/my-content/:provider/source_content' => 'my_content#source_content'
  get 'profile/my-content/:provider/load_images' => 'my_content#load_images'
  match 'my-content/payout'            => 'my_content#payout', via: [:get, :post]
  # get 'profile/my-content/gallery'    => 'sell_content#gallery'

  get 'tags/:tag(/page/:page)' => 'content#find_by_tag', as: 'tag'

  get 'people/:author(/page/:page)' => 'content#find_by_author', as: 'person'

  get 'blog' => redirect("https://blog.lobster.media"), as: :blog
  get 'buyer' => 'orders#buyers_gallery', as: :bought_content
  match 'orders/media/:id' => 'orders#media', via: [:patch, :put, :post, :get]
  get 'user/facebook/mobile' => 'user#facebook_mobile'
  post 'user/update/scenario_connect_sources' => 'user#scenario_connect_sources'
  get 'search' => 'search#create', as: :search_start
  post 'search' => 'search#create'
  get 'search/count' => 'search#count'

  get 'content/:id' => 'content#display', as: :display_content
  get 'image/:id' => 'content#display', as: :image_content
  get 'video/:id' => 'content#display', as: :video_content
  get 'graphics/:id' => 'content#display', as: :graphic_content
  get 'graphics/:id' => 'content#display', as: :graphics_content

  get 'landing/:id' => 'content#landing', as: :landing
  get 'favourites' => 'my_content#favourites', as: :favourites

  post 'content/:id/model_release' => 'content#upload_model_release'
  patch 'content/:id/toggle_needs_release' => 'content#toggle_needs_release'

  # subscriptions
  get 'subscriptions' => 'subscriptions#index'
  get '/subscriptions/trial' => 'subscriptions#show_trial'
  post '/subscriptions/trial' => 'subscriptions#create_trial'
  get 'subscriptions/plans(/:plan)' => 'subscriptions#plans'
  post 'subscriptions/create' => 'subscriptions#create'
  post 'subscription_request' => 'contact_requests#subscription_request'
  post 'subscriptions/cancel' => 'subscriptions#cancel'
  get 'subscriptions/vat_for_country' => 'subscriptions#vat_for_country'
  get 'subscriptions/:id' => 'subscriptions#show'
  post 'subscriptions/case_studies_email' => 'subscriptions#case_studies_email'

  get 'promo' => 'pages#promo'
  get 'promo/:id' => 'promo_pages#show', as: :promo_page

  mount StripeEvent::Engine, at: '/_stripe_events'

  get '/invoice' => 'subscriptions#show_invoice'

  # v2 orders
  post '/v2_orders/create' => 'v2_orders#create'

  get '/v2_orders/create_from_cart' => 'v2_orders#create_from_cart'
  post '/v2_orders/create_from_cart' => 'v2_orders#create_from_cart'
  get '/v2_orders/success' => 'v2_orders#success'

  post '/content/:id/add_to_cart' => 'cart#add_to_cart', as: :add_to_cart
  post '/content/:id/remove_from_cart' => 'cart#remove_from_cart', as: :remove_from_cart
  get '/content/:id/vote' => 'content#vote', as: :vote

  get '/seller', to: redirect {|path_params, req| "/sell-content" }

  root :to => redirect("/marketplace")

  # Instagram API callbacks
  namespace :instagram do
    resources :callbacks do
      member do
        post :update # I'm allowing updates via POST as well.
      end
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  authenticate :admin_user, lambda { |u| u.role == 'admin' } do
    mount Sidekiq::Web => '/jobs'
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
