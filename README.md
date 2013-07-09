# Loop Lingo

Connect to the Loop Lingo Merchant API

## Installation

Add this line to your application's Gemfile:

    gem 'loop_lingo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install loop_lingo

## Usage

After installation (above), here are the commands

### Set the _login_ and _pwd_

Your *login* and *pwd* will be provided to you by Loop Lingo.  You set them on the gem in one of three ways:

```
  # method 1
  LoopLingo.login 'someusername'
  LoopLingo.pwd   'somepassword'

  # method 2
  LoopLingo.config({
    :login => 'someusername',
    :pwd   => 'somepassword'
  })

  # method 3
  LoopLingo.config do |l|
    l.login 'someusername'
    l.pwd   'somepassword'
  end
```

*NOTE:* If you are using Loop Lingo under Rails, this would be a good thing to put inside of an initializer.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
