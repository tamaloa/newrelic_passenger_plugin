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
7. Run `sudo ./newrelic_passenger_agent` (passenger-memory-stats needs sudo to get the exact memory values) to check if everything is set up correctly (several values should be reported to New Relic).
8. Setup monitoring/autostart to keep the agent running continuously or use the daemonized version (see below)

## Running Agent as Daemon

To run the agent as daemon process in the background the daemons gem was included. This provides the usual start/stop/status via PID file stuff.
Run `sudo ./newrelic_passenger_agent.daemon start --ontop` to check if daemonizing works in general and every thing is set up correctly (the agent should report several values).
To start the daemon run `sudo ./newrelic_passenger_agent.daemon start`

## People to thank

The extraction of most values was copied from the munin-plugins-rails gem by Bart ten Brinke:
https://github.com/barttenbrinke/munin-plugins-rails

The Agent was built using the example provided by newrelic:
https://github.com/newrelic-platform/newrelic_example_plugin

