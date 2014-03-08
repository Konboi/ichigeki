# Ichigeki
[![Build Status ](https://api.travis-ci.org/Konboi/ichigeki.png?branch=master)](https://travis-ci.org/konboi/ichigeki)

This is [Script::Ichigeki](https://github.com/Songmu/p5-Script-Ichigeki) ruby version.

## Installation

Add this line to your application's Gemfile:

gem 'ichigeki'

And then execute:

$ bundle

Or install it yourself as:

$ gem install ichigeki

## Usage

```ruby
# sample.rb
require 'ichigeki'

Ichigeki.hissatsu(
  dialog_message: "殺っちゃう？？",
  log_file_postfix: '.ichigeki',
  exec_date: "2014-03-08"
)

puts 'ichigeki: グハッ'

```

```
bundle exec ruby sample.rb
```

```
less .sample.rb.ichigeki
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/ichigeki/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
    3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
    5. Create new Pull Request
