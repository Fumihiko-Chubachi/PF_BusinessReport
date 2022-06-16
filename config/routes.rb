Rails.application.routes.draw do

  root to: 'homes#top'

  ##メモ  /rails/info/routes
  ##      例：rails g controller public/items

  ##メモ  rails db:migrate:status
  ##      rails db:rollback STEP=数字

  # ユーザー用
  # URL /user/sign_in ...
  devise_for :users, controllers: {
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :departments
    resources :users
  end

  namespace :public do
    get "/works/department", to: "works#department", as: "new_select_department_work"
    resources :works
    resources :dailyreports
  end

end