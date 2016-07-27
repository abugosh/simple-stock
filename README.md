# Simple Stock: A coding challenge

## Usage
1. Setup the ember application
```bash
  cd ember
  npm install

  # verify tests pass
  ember test

  # build for hosting
  ember build --environment production
```

1. Setup the Rails application

```bash
  # install ruby-2.3.1
  cd rails

  gem install bundler
  bundle

  # verify the tests pass
  rails db:setup RAILS_ENV=test
  rspec

  # Setup the database
  rails db:setup RAILS_ENV=production

  # Setup the production environment
  export SECRET_KEY_BASE=`rails secret`

  # Activate the server
  rails server -e production
```

1. Go to http://localhost:3000
