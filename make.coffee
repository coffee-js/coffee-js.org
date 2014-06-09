#!/usr/bin/env coffee
project = 'repo/coffee-js.org'

require 'shelljs/make'
path = require 'path'
mission = require 'mission'

mission.time()

jade = ->
  mission.jade
    file: 'index.jade'
    from: 'layout/'
    to: './'
    extname: '.html'
    options:
      pretty: yes
      filename: 'layout/index.jade'

target.jade = ->
  jade()

target.watch = ->
  station = mission.reload()

  mission.watch
    files: ['layout/']
    trigger: (filepath, extname) ->
      switch extname
        when '.jade'
          jade()
          station.reload project

target.rsync = ->
  mission.rsync
    file: './'
    dest: 'tiye:~/repo/coffee-js.org/'
    options:
      exclude: [
        'node_modules/'
        'layout/'
        'README.md'
        '.git/'
      ]