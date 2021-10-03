# README

# Wispay App Api

Backend Service for Wispay App

## Getting Started

## Clone the repository

  ```shell
  git clone git@github.com:syaifulmillah26/wispay.git
  cd project
  ```

### Check your Ruby version

  ```shell
  ruby -v
  ```

The ouput should start with something like `ruby 2.6.5`

If not, install the right ruby version using [rvm](https://rvm.io/) (it could take a while):

  ```shell
  rvm install 'ruby-2.6.5'
  rvm use 2.6.5
  ```

### Database
Postgres
visit
[Postgres](https://medium.com/@viviennediegoencarnacion/getting-started-with-postgresql-on-mac-e6a5f48ee399) for installation guide


### Install Dependencies

Using [Bundler](https://github.com/bundler/bundler)

  ```shell
  bundle install

  Using redis 4.4.0
  Using rspec-support 3.10.2
  Using rspec-core 3.10.1
  Using rspec-expectations 3.10.1
  Using rspec-mocks 3.10.2
  Using rspec-rails 5.0.2
  Using spring 3.0.0
  Using state_machines 0.5.0
  Using state_machines-activemodel 0.8.0
  Using state_machines-activerecord 0.8.0
  Bundle complete! 19 Gemfile dependencies, 83 gems now installed.
  Use `bundle info [gemname]` to see where a bundled gem is installed.
  ```

Redis for actionCable purpose

  ```shell
  brew install redis
  redis-server

  20430:M 18 Sep 2021 22:46:01.152 # Server initialized
  20430:M 18 Sep 2021 22:46:01.153 * Loading RDB produced by version 6.0.9
  20430:M 18 Sep 2021 22:46:01.153 * RDB age 4 seconds
  20430:M 18 Sep 2021 22:46:01.153 * RDB memory usage when created 1.50 Mb
  20430:M 18 Sep 2021 22:46:01.157 * DB loaded from disk: 0.005 seconds
  20430:M 18 Sep 2021 22:46:01.157 * Ready to accept connections
  ```

### Set environment variables

Copy env example file and adjust it.

  ```shell
  cp .env.example .env
  ```

### Initialize the database

  ```shell
  rails db:create db:migrate db:seed

  Created database 'wispay-app-test'
  == 20211002140251 DeviseCreateUsers: migrating ================================
  -- create_table(:users)
    -> 0.0244s
  -- add_index(:users, :email, {:unique=>true})
    -> 0.0126s
  -- add_index(:users, :reset_password_token, {:unique=>true})
    -> 0.0060s
  == 20211002140251 DeviseCreateUsers: migrated (0.0434s) =======================

  == 20211002151042 CreateProducts: migrating ===================================
  -- create_table(:products)
    -> 0.0260s
  == 20211002151042 CreateProducts: migrated (0.0261s) ==========================

  == 20211002161925 CreateActiveStorageTables: migrating ========================
  -- create_table(:active_storage_blobs, {})
    -> 0.0194s
  -- create_table(:active_storage_attachments, {})
    -> 0.0258s
  -- create_table(:active_storage_variant_records, {})
    -> 0.0178s
  == 20211002161925 CreateActiveStorageTables: migrated (0.0633s) ===============
  ```

### Run The Application

  ```shell
  rails server

  => Booting Puma
  => Rails 6.1.4.1 application starting in development
  => Run `bin/rails server --help` for more startup options
  Puma starting in single mode...
  * Puma version: 5.5.0 (ruby 2.6.5-p114) ("Zawgyi")
  *  Min threads: 5
  *  Max threads: 5
  *  Environment: development
  *          PID: 49342
  * Listening on http://127.0.0.1:3000
  * Listening on http://[::1]:3000
  Use Ctrl-C to stop
  ```


### Run Test Driven Development

  ```shell
  rake spec

    Forgot Password
      using existing email should return success
      using non-existing email should return failed
    Reset Password
      using valid email and token should return success
      using invalid email should return failed

  Finished in 1.86 seconds (files took 2.41 seconds to load)
  42 examples, 0 failures
  ```

## Authors

- **Saeful Millah** - _Initial work_
