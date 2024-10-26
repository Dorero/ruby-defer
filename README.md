# Ruby-defer

The gem allows you to do deferred tasks within a block. It monkey patches the kernel module, so the with_defer function is available from anywhere.

## Installation

```gem install ruby-defer``` or put ```gem 'ruby-defer', '~> 0.1.0'``` inside your Gemfile


## Usage

```
with_defer do |defer|
    num = 2
    defer << -> { num *= num }
    puts num
end

puts num

# Output: 
# 2
# 4
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

