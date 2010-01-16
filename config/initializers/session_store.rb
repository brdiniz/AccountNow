# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_account-now_session',
  :secret      => '5351ee2756c7dddca82a8a3c0cf77a15bb3a96cb3b8677d12dc9cc930b8e61f7ab20e743a7d62cfda84e5b522224099351ad9217e3de91f1278bc8a784e9712b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
