Rails.application.routes.draw do
  devise_for :users
  root 'posts#home'
  post 'posts/create',as: :posts
  delete 'posts/:id',to:'posts#destroy',as: :destroy_post
  post 'comments/create',to:'comments#create',as: :comments
  delete 'comments/:id',to:'comments#destroy',as: :destroy_comment
  get 'posts/:id/likes',to:'posts#likes',as: :likes
  get'likes/toggle/:post_id',to:'likes#toggle',as: :toggle_like
  get'likes/toggleC/:comment_id',to:'likes#toggleC',as: :toggleC_like
  get 'posts/:id/Clikes',to:'posts#Clikes',as: :Clikes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end