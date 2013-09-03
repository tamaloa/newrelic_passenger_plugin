## Example Agent Install

1. Download the latest version
2. Extract to the location you want to run the agent from
3. Copy `config/template_newrelic_plugin.yml` to `config/newrelic_plugin.yml`
4. Edit `config/newrelic_plugin.yml` and replace "YOUR_LICENSE_KEY_HERE" with your New Relic license key
5. Run `sudo newrelic_passenger_agent` (passenger-memory-stats needs sudo to get the exact memory values)
6. Setup monitoring/autostart to keep the agent running continuously

## People to thank

The extraction of most values was copied from the munin-plugins-rails gem by Bart ten Brinke:
https://github.com/barttenbrinke/munin-plugins-rails

The Agent was built using the example provided by newrelic:
https://github.com/newrelic-platform/newrelic_example_plugin

