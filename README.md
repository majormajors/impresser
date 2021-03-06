# impresser

[![Build Status](https://secure.travis-ci.org/majormajors/impresser.png)](http://travis-ci.org/majormajors/impresser)

Impresser gives your rubies the game they need to hook up with your Wordpress.

## Usage

Add the following to your Gemfile.

```ruby
gem "impresser"
```

Then, create an initializer named `config/initializers/impresser.rb`

```ruby
Impresser.setup(:active_record, :connect => {
  :adapter  => "mysql2",
  :encoding => "utf8",
  :host     => "localhost",
  :port     => 3306,
  :database => "db_name",
  :username => "db_user",
  :password => "db_pass"
}

# This line is optional, but you can uncomment it if you want to
# pull the models into the global namespace. Don't do this if you
# have models that would cause naming conflicts with the Impresser
# models.
#
# include Impresser::ActiveRecord
```

Only ActiveRecord is supported now, but I want to support DataMapper and Sequel in future versions.

## Todo

* Better test coverage
* Better support for dealing with file attachments; perhaps integration with paperclip?
* More seamless configuration with the option to fine-tune it where needed
* DataMapper support
* Sequel support

## Copyright

Copyright (c) 2012 Matt Mayers. See LICENSE for details.
