[![Build Status](https://travis-ci.org/deseretbook/loop_lingo.png?branch=master)](https://travis-ci.org/deseretbook/loop_lingo)

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

Your *login* and *pwd* will be provided to you by Loop Lingo.  You set them on
the gem in one of three ways:

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

*NOTE:* If you are using Loop Lingo under Rails, this would be a good thing to
put inside of an initializer.

### Getting a list loops

```
  LoopLingo.loops
```

This returns a LoopLingo::Loops object. To get the array of loops, call
#loops() on that, which will return an array of LoopLingo::Loop objects.

The LoopLingo::Loops object includes the Enumerable module, so methods such
as #first, #last, #each and #map will iterate over the contents of #loops.

### Getting an individual loop

There is currently no way in the API to load an individual Loop by id.

If you needed that, a simple #detect() will be what you'd use:

```
  response = LoopLingo.loops
  loop = response.loops.detect{|l|l.id == "L12345"}
```

The attributes for the loop can be queried as methods:

```
  # assuming the loop object from example above
  loop.id      # "L12345"
  loop.created # "2013-07-15T21:26:54+00:00"
```

The currently returned attributes are:

  * product
  * product_id
  * parent
  * created
  * generation
  * price
  * revenue
  * id
  * url
  * points
  * image_url
  * user
  * fb_posted
  * promotion
  * total
  * message
  * posted

### Closing a loop

Two ways.  You can close a loop directly from the LoopLingo::Loop object that
you would get from the LoopLingo::Loops#loops method:

```
  response = LoopLingo.loops
  loop = response.loops.first # will be an instance of LoopLingo::Loop
  loop.complete!
```

The second way is to complete the loop with the ID directly:

```
  LoopLingo.complete_loop("L54321")
```

When using either appraoch, you can pass hash of options that will be sent in
turn to the LoopLingo complete loop api endpoint.

```
  # examples of setting options for a complete loop request
  LoopLingo.complete_loop("L54321", { :price => 99.0, :total => 100.0 })

  # direct from the Loop object
  loop = LoopLingo.loops.loops.first # will be an instance of LoopLingo::Loop
  loop.complete!({ :price => 99.0, :total => 100.0 })
```

Both methods will return a LoopLingo::Boolean response object that you can
query to get the success or failure status of the request.

### Cancelling a loop

Two ways.  You can cancel a loop directly from the LoopLingo::Loop object that
you would get from the LoopLingo::Loops#loops method:

```
  response = LoopLingo.loops
  loop = response.loops.first # will be an instance of LoopLingo::Loop
  loop.cancel!
```

The second way is to complete the loop with the ID directly:

```
  LoopLingo.cancel_loop("L54321")
```

### Catching errors

Most methods will return a response object that includes #error?, #errors and
#success? methods.  For example, if I were attempt to complete a loop that had
already been completed, here is what I would do to check for the error:

```
  response = LoopLingo.complete_loop("L23539")
  if response.error? # !response.success? would work here too
    puts "Loop not completed because:"
    puts response.errors.join(', ')
  else
    puts "Loop completed"
  end

  # would print:
  # Loop not completed because:
  # Loop already completed
```

### Getting a list loops

```
  LoopLingo.loops
```

This returns a LoopLingo::Loops object. To get the array of loops, call #loops() on that, which will return an array of LoopLingo::Loop objects.

### Getting an individual loop

There is currently no way in the API to load an individual Loop by id.

If you needed that, a simple #detect() will be what you'd use:

```
  response = LoopLingo.loops
  loop = response.loops.detect{|l|l.id == "L12345"}
```

The attributes for the loop can be queried as methods:

```
  # assuming the loop object from example above
  loop.id      # "L12345"
  loop.created # "2013-07-15T21:26:54+00:00"
```

The currently returned attributes are:

  * product
  * product_id
  * parent
  * created
  * generation
  * price
  * revenue
  * id
  * url
  * points
  * image_url
  * user
  * fb_posted
  * promotion
  * total
  * message
  * posted

### Closing a loop

Two ways.  You can close a loop directly from the LoopLingo::Loop object that you would get from the LoopLingo::Loops#loops method:

```
  response = LoopLingo.loops
  loop = response.loops.first # will be an instance of LoopLingo::Loop
  loop.complete!
```

The second way is to complete the loop with the ID directly:

```
  LoopLingo.complete_loop("L54321")
```

When using either appraoch, you can pass hash of options that will be sent in turn to the LoopLingo complete loop api endpoint.

```
  # examples of setting options for a complete loop request
  LoopLingo.complete_loop("L54321", { :price => 99.0, :total => 100.0 })

  # direct from the Loop object
  loop = LoopLingo.loops.loops.first # will be an instance of LoopLingo::Loop
  loop.complete!({ :price => 99.0, :total => 100.0 })
```

Both methods will return a LoopLingo::Boolean response object that you can query to get the success or failure status of the request.

### Cancelling a loop

Two ways.  You can cancel a loop directly from the LoopLingo::Loop object that you would get from the LoopLingo::Loops#loops method:

```
  response = LoopLingo.loops
  loop = response.loops.first # will be an instance of LoopLingo::Loop
  loop.cancel!
```

The second way is to complete the loop with the ID directly:

```
  LoopLingo.cancel_loop("L54321")
```

Both methods will return a LoopLingo::Boolean response object that you can query to get the success or failure status of the request.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add tests for your additions and ensure existing tests pass
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
