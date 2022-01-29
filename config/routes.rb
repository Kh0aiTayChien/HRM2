Rails.application.routes.draw do
  devise_for :users
  root "employee#index"
  as :user do
    get "sign_in" => "devise/sessions#new"
    post "sign_in" => "devise/sessions#create"
    get "sign_out" => "devise/sessions#destroy"
  end

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
end
