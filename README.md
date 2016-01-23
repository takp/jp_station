# JpStation

JpStation helps you to get the near station data from latitude and longitude using api. ( http://map.simpleapi.net/ ) 
The response data is only in Japanese.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jp_station'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jp_station

## Usage

You can get stations near the latitude and the longitude you set.

```ruby
lat, lng = ["34.673150", "135.501005"]
response = JpStation::Simpleapi.stations(lat, lng)
```

The response is Hash object.

```ruby
response[:count] # => 8
response[:stations].length # => 8
response[:stations].first[:name] # => "心斎橋駅"
```

The response data is like this.

```ruby
{:count=>8,
 :stations=>
  [{:name=>"心斎橋駅",
    :furigana=>"しんさいばしえき",
    :line=>"大阪市営御堂筋線ほか",
    :city=>"大阪市中央区",
    :prefecture=>"大阪府",
    :direction=>"北西",
    :directionReverse=>"南東",
    :distance=>"150",
    :distanceM=>"150m",
    :distanceKm=>"0.2km",
    :traveltime=>"徒歩2分以上"},
```

## Station API Services

This gem use the api service.

About api services (Japanese) : http://map.simpleapi.net/

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jp_station. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

