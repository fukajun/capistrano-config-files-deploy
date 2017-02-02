# Capistrano::ConfigFilesDeploy

Deploy config files from other git repository

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-config-files-deploy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-config-files-deploy

## Usage

Add require to Capfile

```ruby
require "capistrano/config_files_deploy"
```

Setting config/deploy.rb

```ruby
set :config_files_git_url, 'git@github.com:username/path-to-private-repository'
set :config_files_revision, 'v1.2.0'
set :config_files, { 'config/env.production' => '.env.production' }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fukajun/capistrano-config-files-deploy.

