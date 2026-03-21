# Changelog

## [0.1.0] - 2026-03-21

### Added
- Initial release
- `Helpers::Client` — Faraday connection builder targeting Pi-hole admin API with auth token query parameter
- `Runners::Stats` — summary, top_items, top_clients, over_time_data_10mins, query_types
- `Runners::Lists` — list_domains, add_domain, remove_domain, enable, disable
- Standalone `Client` class for use outside the Legion framework
