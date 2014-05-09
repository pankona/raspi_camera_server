# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
RaspiServer::Application.config.secret_key_base = '133e768ec63ebf329279df7a5381ad9397c2e6609a2ae592120b50787da274ca029e98d271e9475ab4f51500ddc37f136144626d0ab8d58762aa48ff6fe5d917'
