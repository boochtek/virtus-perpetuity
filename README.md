# Virtus::Perpetuity

This gem will allow you to use Virtus to define attributes for models that are mapped with Perpetuity.
It will also automatically generate the mapper for your mode.


## Installation

Include the appropriate Perpetuity gem, as well as the Virtus::Perpetuity gem in your `Gemfile`:

    gem 'perpetuity-mongodb'
    gem 'virtus-perpetuity'

And then execute:

    $ bundle


## Usage

To use Virtus::Perpetuity, you'll need to first define the Perpetuity repository, as you normally would.
We'd recommend that you do this in your configuration setup (i.e. a Rails initializer).
It will look something like this.

```ruby
Perpetuity.data_source :mongodb, 'my_mongo_database'
```

Then simply add `include Virtus::Perpetuity.model` to your model class, and define the model attributes using Virtus.
For example:

```ruby
class User
  include Virtus::Perpetuity.model
  attribute :name, String, from: :first_name
  attribute :age, Integer, required: false
end
```

Once you've defined your model, a Perpetuity mapping will be created for you, and you can then use Perpetuity as you normally would:

```ruby
class User
  include Virtus::Perpetuity.model
  attribute :name, String, from: :first_name
  attribute :age, Integer, required: false
end

Perpetuity[User].insert(User.new(name: 'Craig'))
craig = Perpetuity[User].find{|user| user.name == 'Craig'}
```


## TODO

* Allow specifying indexes.
* Allow specifying how IDs are generated.
* Allow mapping object attributes to different DB fields (once Perpetuity supports that).
* Allow specifying an alternative mapper (once Perpetuity supports that).
* Allow specifying different data sources (once Perpetuity supports that).
* Allow specifying attributes to include or exclude in the mapper.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
