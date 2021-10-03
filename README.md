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

Redis for actionCable & Sidekiq

  ```shell
  brew install redis
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


### Run The Sidekiq

  ```shell
  bundle exec sidekiq -c 1

  2021-10-03T11:09:11.663Z pid=4693 tid=oxiwmixvt INFO: Booted Rails 6.1.4.1 application in development environment
  2021-10-03T11:09:11.663Z pid=4693 tid=oxiwmixvt INFO: Running in ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin20]
  2021-10-03T11:09:11.663Z pid=4693 tid=oxiwmixvt INFO: See LICENSE and the LGPL-3.0 for licensing details.
  2021-10-03T11:09:11.663Z pid=4693 tid=oxiwmixvt INFO: Upgrade to Sidekiq Pro for more features and support: https://sidekiq.org
  2021-10-03T11:09:11.674Z pid=4693 tid=oxiwmixvt INFO: Starting processing, hit Ctrl-C to stop
  ```


### Run Redis Server

  ```shell
  redis-server

  5718:M 03 Oct 2021 18:13:53.548 # Server initialized
  5718:M 03 Oct 2021 18:13:53.549 * Loading RDB produced by version 6.0.9
  5718:M 03 Oct 2021 18:13:53.549 * RDB age 8 seconds
  5718:M 03 Oct 2021 18:13:53.549 * RDB memory usage when created 1.67 Mb
  5718:M 03 Oct 2021 18:13:53.553 * DB loaded from disk: 0.004 seconds
  5718:M 03 Oct 2021 18:13:53.553 * Ready to accept connections
  ```


### Run Test Driven Development

  ```shell
  rake spec

  Products::Broadcast
    testing worker
      Products::Broadcast jobs are enqueued in the default queue
      occurs at expected time

  Products::ProductInformation
    testing worker
      Products::ProductInformation jobs are enqueued in the default queue
      occurs at expected time

  Finished in 2.03 seconds (files took 2.6 seconds to load)
  44 examples, 0 failures
  ```

## Authors

- **Saeful Millah** - _Initial work_
