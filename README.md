# Hertz::Courier::Intercom

[![Gem Version](https://img.shields.io/gem/v/hertz-courier-intercom.svg?maxAge=2592000&style=flat-square)](https://rubygems.org/gems/hertz-courier-intercom)
[![Dependency Status](https://img.shields.io/gemnasium/alessandro1997/hertz-courier-intercom.svg?maxAge=2592000&style=flat-square)](https://gemnasium.com/github.com/alessandro1997/hertz-courier-intercom)
[![Code Climate](https://img.shields.io/codeclimate/github/alessandro1997/hertz-courier-intercom.svg?maxAge=2592000&style=flat-square)](https://codeclimate.com/github/alessandro1997/hertz-courier-intercom)

This is a [Hertz](https://github.com/alessandro1997/hertz) courier for sending
notifications to your users as [Intercom](https://www.intercom.io) conversations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hertz-courier-intercom'
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install hertz-courier-intercom
```

Then, run the installer generator:

```console
$ rails g hertz:courier:intercom:install
```

You will also need to expose the `hertz_intercom_id` method in your receiver
class:

```ruby
class User < ActiveRecord::Base
  include Hertz::Notifiable

  def hertz_intercom_id
    id
  end
end
```

If `#hertz_intercom_id` returns an empty value (i.e. `false`, `nil` or an
empty string) at the time the job is executed, the notification will not be
delivered. This allows you to programmatically enable/disable email
notifications for a user:

```ruby
class User
  include Hertz::Notifiable

  def hertz_intercom_id
    id if send_through_intercom?
  end
end
```

## Usage

In order to use this courier, add `:intercom` to `deliver_by` in the
notification model(s):

```ruby
class CommentNotification < Hertz::Notification
  deliver_by :intercom
end
```

Now, add the `intercom_subject` and `intercom_body` methods in your notification
class:

```ruby
class CommentNotification < Hertz::Notification
  def intercom_subject
    'You have a new comment!'
  end

  def intercom_body
    'Hey man, you got a new comment waiting for you!'
  end
end
```

**NOTE:** This courier uses the [deliveries API](https://github.com/alessandro1997/hertz#tracking-delivery-status)
to prevent double deliveries.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/alessandro1997/hertz-courier-intercom.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

# To do

- [ ] Allow changing the job's queue
