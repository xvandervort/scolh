# Scolh

Scolh stands for something like "Smart COntract Language for Humans." This is proof of concept code that is intended to allow people to enter contract information in plain language and then generate a code or configuration file that a smart language interpreter can work with. Or something like that. Ideas may become more clear as time and work go on.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scolh'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scolh

## Usage

    $ bundle exec exe/scolh

This will start a command shell for entering contract terms as (roughly) plain English sentences. The shell will show a number at the prompt, corresponding (in theory) to the order of terms entered.

Examples (good so far):

```
    party joe has payment address 1FfmbHfnpaZjK4vyi1okTjHHvtN455paPH
```

The above means that one of the parties to the contract is referred to as joe and can receive payments at the stated address (on some blockchain somewhere)

```
  pay $35 from joe to jim on 3/21/2099
```

The above indicates an obligation for party named "joe" to pay another party named "jim" $35 (in some coin, not currently specified) on the stated date.

```
  term start 12/11/2017
```

The above indicates that the contract comes into force on December 11, 2017. Conditions (such as 10 days after signature) and end date are not yet implemented.

```
  list
```

The above prints out the current terms in the order they were entered.

```
  print
```

The print command prints out (fragments of) working contract code

```
  check
```

The check command examines contract terms for internal consistency. For example, a contract that has only one party isn't really a contract. Or if both parties have the same payment address - or no address at all, that would also fail the check (at least, once that bit is implemented).

```
  quit
```
  
The above exits the shell. Don't ask why it's not "exit." It's just not (so far).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/xvandervort/scolh.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

