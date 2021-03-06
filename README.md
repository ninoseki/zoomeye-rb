# zoomeye-rb

[![Ruby CI](https://github.com/ninoseki/zoomeye-rb/actions/workflows/test.yml/badge.svg)](https://github.com/ninoseki/zoomeye-rb/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/zoomeye-rb/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/zoomeye-rb?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/ninoseki/zoomeye-rb/badge)](https://www.codefactor.io/repository/github/ninoseki/zoomeye-rb)

[ZoomEye](https://www.zoomeye.org/) API wrapper for Ruby.

## Installation

```bash
gem install zoomeye
```

## Usage

```ruby
require "zoomeye"

# when given nothing, it tries to load your API key via ENV["ZOOMEYE_API_KEY"]
api = ZoomEye::API.new

# or you can set them manually
api = ZoomEye::API.new(api_key: "YOUR_API_KEY")

# Host search
api.host.search("port:80 nginx")
api.host.search("port:80 nginx", page: 7, facets: "app,device")

# Web search
api.web.search("wordpress")
api.web.search("wordpress", page: 1, facets: "app.os")

# Resource info
api.resource_info.get
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ninoseki/zoomeye-rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
