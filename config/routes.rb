CerberusServer::Application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :scenarios, only: [:create, :index, :show]
      resources :records, only: [:create]
      resources :reports, only: [:create, :update] do
        member do
          get 'memory_leak_class'
          get 'memory_leak_instance'
          get 'cpu'
        end
      end
    end
  end

  devise_for :users, path_names: {sign_in: 'login', sign_up: 'register', sign_out: 'logout'}

  resources 'projects', except: [:new] do
    resources 'scenarios'
    resources 'reports'
  end

  resources 'reports',only: [:index, :show] do
    resource 'memory', only: [:show]
    resource 'cpu', only: [:show]
    resource 'network', only: [:show]
    resource 'battery', only: [:show]
  end

  root to: "projects#index"
end
