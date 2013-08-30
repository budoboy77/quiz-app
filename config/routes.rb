QuizApp::Application.routes.draw do
  get "/"                       => "main#root_get"
  get "/register"               => "main#register_get"
  post "/register"              => "main#register_post"
  get "/login"                  => "main#login_get"
  post "/login"                 => "main#login_post"
  get "/quiz"                   => "main#quiz_get"
  get "/help"                   => "main#help_get"
  get "/clicked"                => "main#clicked_get"
  get "/admin"                  => "admin#admin_get"
  get "/admin/questions"        => "admin#questions_get"
  get "/admin/questions/:id"    => "admin#questions_params_get"
  post "/admin/questions/:id"   => "admin#questions_params_post"
  get "/admin/categories"       => "admin#categories_get"
  get "/admin/categories/:id"   => "admin#categories_params_get"
  post "/admin/categories/:id"  => "admin#categories_params_post"
  get "/admin/types"            => "admin#types_get"
  get "/admin/types/:id"        => "admin#types_params_get"
  post "/admin/types/:id"       => "admin#types_params_post"
  get "/admin/quiz-builder"     => "admin#quiz_builder_get"
end
