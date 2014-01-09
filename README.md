## Introduction

A simple Newrelic agent which collects stats from Phusion Passenger by using the built in status commands.
[![Build Status](https://travis-ci.org/tamaloa/newrelic_passenger_plugin.png?branch=master)](https://travis-ci.org/tamaloa/newrelic_passenger_plugin) tested on all major C ruby versions.


## Passenger Agent Installation

1. Download the latest version
2. Extract to the location you want to run the agent from
3. `bundle install --deployment` to get the necessary gems
4. Copy `config/template_newrelic_plugin.yml` to `config/newrelic_plugin.yml`
5. Edit `config/newrelic_plugin.yml` and replace "YOUR_LICENSE_KEY_HERE" with your New Relic license key
6. Edit `config/newrelic_plugin.yml` and add the full path to your passenger-status and passenger-memory-stats command
as well as the version used. Make sure you determine the right version and paths, many systems have several passenger gems/packages installed.
7. Run `sudo ./newrelic_passenger_agent` (passenger-memory-stats needs sudo to get the exact memory values)
8. Setup monitoring/autostart to keep the agent running continuously

## People to thank

The extraction of most values was copied from the munin-plugins-rails gem by Bart ten Brinke:
https://github.com/barttenbrinke/munin-plugins-rails

The Agent was built using the example provided by newrelic:
https://github.com/newrelic-platform/newrelic_example_plugin

