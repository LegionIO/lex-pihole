# lex-pihole

LegionIO extension for Pi-hole integration via the Pi-hole admin API.

## Installation

Add to your Gemfile:

```ruby
gem 'lex-pihole'
```

## Standalone Usage

```ruby
require 'legion/extensions/pihole'

client = Legion::Extensions::Pihole::Client.new(
  url:   'http://pi.hole/admin/api.php',
  token: 'your-api-token'
)

# Stats
client.summary
client.top_items(count: 10)
client.top_clients(count: 10)
client.over_time_data_10mins
client.query_types

# Lists
client.list_domains(list: 'white')
client.list_domains(list: 'black')
client.add_domain(list: 'white', domain: 'safe.example.com')
client.remove_domain(list: 'black', domain: 'ads.example.com')

# Control
client.enable
client.disable
client.disable(duration: 30)  # disable for 30 seconds
```

## Authentication

The Pi-hole admin API token is passed as the `auth` query parameter on every request. Obtain your token from the Pi-hole web admin panel under Settings > API / Web interface.

## License

MIT
