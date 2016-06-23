# Libholdings

This gem uses the Z39.50 library ruby-zoom to get item holdings information from an ILS. 


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'libholdings'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install libholdings

## Usage

```ruby
require 'libholdings'

r = Libholdings::Request.new
r.server = 'miami.alma.exlibrisgroup.com'
r.port = 1921
r.database_name = '01UOML_INST'
r.record_id = '9910311107102976'

holdings = Libholdings::info(r)
```

You'll get back a hash with the holdings information:

```ruby 
{
    "holdings" => {
        "holding" => [{
            "encodingLevel" => "3", "localLocation" => "Richter Library", "shelvingLocation" => "Special Format Microfilm Monograph", "callNumber" => "Mfilm 7397", "volumes" => {
                "volume" => {
                    "enumeration" => "       ", "chronology" => "     "
                }
            }, "circulations" => {
                "circulation" => {
                    "availableNow" => {
                        "value" => "1"
                    }, "renewable" => {
                        "value" => "0"
                    }, "onHold" => {
                        "value" => "0"
                    }
                }
            }
        }, {
            "encodingLevel" => "3", "localLocation" => "Special Collections", "shelvingLocation" => "Microform", "callNumber" => "Mfilm 7397", "volumes" => {
                "volume" => {
                    "enumeration" => "       ", "chronology" => "     "
                }
            }, "circulations" => {
                "circulation" => {
                    "availableNow" => {
                        "value" => "1"
                    }, "renewable" => {
                        "value" => "0"
                    }, "onHold" => {
                        "value" => "0"
                    }
                }
            }
        }]
    }
}
```

If there isn't any information for the item you are searching for you'll get a standard response:

```ruby 
{
    "holdings" => {
        "holding" => {
            "localLocation" => "Unknown", "callNumber" => "Unknown ", "publicNote" => "DUE"
        }
    }
}
```

# Tests
To run the tests:

```bash
rake test
```




