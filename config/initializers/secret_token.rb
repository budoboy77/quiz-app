# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
QuizApp::Application.config.secret_key_base = Rails.env.production? ? ENV['SESSION_SECRET'] : 'c43157f86a8efacc8967149bc833c12a59f8dfa1f78c4ad57e91a14474bafa7a1ca1a8e08fd1ed0387b321980ad2cceb77615d16ed83a121158ac32e9094b48c'
