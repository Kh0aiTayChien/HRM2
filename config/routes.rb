Rails.application.routes.draw do
  # scope "(:locale)", locale: /en|vi/ do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  as :user do
    get "sign_in" => "users/sessions#new"
    post "sign_in" => "users/sessions#create"
    get "sign_up" => "users/registrations#new"
    post "sign_up" => "users/registrations#create"
    get "sign_out" => "users/sessions#destroy"
    get "change_pw" => "users/passwords#edit"
    put "change_pw" => "users/passwords#update"
  end


  devise_scope :user do

    authenticated :user do
      root 'employee#index', as: :authenticated_root
      get "sign_out" => "devise/sessions#destroy"
      get 'dpms/list' => 'department#list'
      get 'dpms/new' => 'department#new'
      post 'dpms/create' => 'department#create'
      get 'dpms/show' => 'department#show'
      patch 'dpms/update' => 'department#update'
      get 'dpms/update' => 'department#update'
      get 'dpms/edit' => 'department#edit'
      get 'dpms/delete' => 'department#delete'

      get 'prj/list' => 'project#list'
      get 'prj/new' => 'project#new'
      post 'prj/create' => 'project#create'
      get 'prj/show' => 'project#show'
      patch 'prj/update' => 'project#update'
      get 'prj/update' => 'project#update'
      get 'prj/edit' => 'project#edit'
      get 'prj/delete' => 'project#delete'

      get 'epl/list' => 'employee#list'
      get 'epl/new' => 'employee#new'
      post 'epl/create' => 'employee#create'
      get 'epl/show' => 'employee#show'
      patch 'epl/update' => 'employee#update'
      get 'epl/update' => 'employee#update'
      get 'epl/edit' => 'employee#edit'
      get 'epl/delete' => 'employee#delete'
      get 'epl/info' => 'employee#info'


      get 'user/list' => 'user#list'
      get 'user/delete' => 'user#delete'

      resources 'employee_project'
      # get 'employee_project/delete' => 'employee_project#destroy'
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end
  # devise_for :users
  # root "employee#index"
end
