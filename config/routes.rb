QuizApp::Application.routes.draw do
  get "/"                       => "main#root_get"
  get "/register"               => "main#register_get"
  post "/register"              => "main#register_post"
  get "/login"                  => "main#login_get"
  post "/login"                 => "main#login_post"
  get "/logout"                 => "main#logout"
  get "/myquizzes"              => "main#myquizzes_get"
  get "/quiz/:quiz_id"          => "main#quiz_get"
  post "/quiz/:quiz_id"         => "main#quiz_post"
  get "/help"                   => "main#help_get"
  get "/clicked"                => "main#clicked_get"
  get "/myquizzes/:quiz_id"     => "main#quiz_detail_params_get"
  get "/admin"                  => "admin#admin_get"
  get "/admin/login"            => "admin#login_get"
  post "/admin/login"           => "admin#login_post"
  get "/admin/logout"           => "admin#logout"
  get "/admin/questions"        => "admin#questions_get"
  get "/admin/questions/:id"    => "admin#questions_params_get"
  post "/admin/questions/:id"   => "admin#questions_params_post"
  get "/admin/categories"       => "admin#categories_get"
  get "/admin/categories/:id"   => "admin#categories_params_get"
  post "/admin/categories/:id"  => "admin#categories_params_post"
  # get "/admin/types"            => "admin#types_get"
  # get "/admin/types/:id"        => "admin#types_params_get"
  # post "/admin/types/:id"       => "admin#types_params_post"
  get "/admin/quiz-builder"     => "admin#quiz_builder_get"
  get "/admin/quiz-builder/:id" => "admin#quiz_builder_params_get"
  post "/admin/quiz-builder/:id" => "admin#quiz_builder_params_post"
  get "/admin/user-quiz-results/:id"  => "admin#user_quiz_results"
  get "/admin/users"           => "admin#users_get"
  get "/admin/users/:id"        => "admin#users_params_get"
  post "/admin/users/:id"       => "admin#users_params_post"
  get "/admin/user/:user_id/quiz/:quiz_id"           => "admin#users_quiz_results_params_get"
  get '*a', :to => 'errors#routing'
end
