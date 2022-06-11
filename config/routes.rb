Rails.application.routes.draw do

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
end