Rails.application.routes.draw do

  root to: 'homes#top'

  # ユーザー用
  # URL /user/sign_in ...
  devise_for :users, skip: [:registrations, :passwords] , controllers: {
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  
  # 管理者側ルーティング設定
  namespace :admin do
    resources :departments, only: [:index, :edit, :create, :update]
    resources :users, only: [:new, :index, :show, :edit, :create, :update]
  end
  
  # ユーザー側ルーティング設定
  namespace :public do
    get "/works/department", to: "works#department", as: "new_select_department_work"
    resources :users, only: [:show]
    resources :works, only: [:new, :show, :edit, :create, :update, :destroy]
    resources :work_comments, only: [:create, :destroy]
    resources :dailyreports, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    resources :dailyreport_comments, only: [:create, :destroy]
  end

end