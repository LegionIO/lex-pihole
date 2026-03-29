# lex-pihole: Pi-hole Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to Pi-hole via the admin API. Provides runners for DNS blocklist management and statistics queries.

**GitHub**: https://github.com/LegionIO/lex-pihole
**License**: MIT
**Version**: 0.1.2

## Architecture

```
Legion::Extensions::Pihole
├── Runners/
│   ├── Lists   # list_domains, add_domain, remove_domain (whitelist/blacklist)
│   └── Stats   # summary, top_items, top_clients, over_time_data_10mins, query_types, enable, disable
├── Helpers/
│   └── Client  # Faraday connection (Pi-hole admin API, auth token as query param)
└── Client      # Standalone client class (includes all runners)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/pihole.rb` | Entry point, extension registration |
| `lib/legion/extensions/pihole/runners/lists.rb` | Blocklist/allowlist management runners |
| `lib/legion/extensions/pihole/runners/stats.rb` | Statistics and control runners |
| `lib/legion/extensions/pihole/helpers/client.rb` | Faraday connection builder (auth token via query param) |
| `lib/legion/extensions/pihole/client.rb` | Standalone Client class |

## Authentication

The Pi-hole admin API token is appended as the `auth` query parameter on every request. Obtain the token from the Pi-hole web admin panel under Settings > API / Web interface.

## Dependencies

| Gem | Purpose |
|-----|---------|
| `faraday` (~> 2.0) | HTTP client for Pi-hole admin API |

## Development

19 specs total.

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
