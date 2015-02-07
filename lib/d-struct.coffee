# Grab a few objects that we'll need
popen = require('child_process').exec
path = require('path')
platform = require('os').platform

# Open a terminal and run dub
dub_build = ->
  # Run the terminal app
  cmdline = "osascript -e \'tell application \"Terminal\" to do script \"cd #{atom.project.path}; dub build\"\'"
  popen cmdline

# Open a terminal and run the app with dub
dub_run = ->
  # Run the terminal app
  cmdline = "osascript -e \'tell application \"Terminal\" to do script \"cd #{atom.project.path}; dub run\"\'"
  popen cmdline

module.exports =
  # Bind workspace command to run_dub
  activate: (state) ->
    atom.workspaceView.command "d-struct:dub-build", => @dubbuild()
    atom.workspaceView.command "d-struct:dub-run", => @dubrun()
  dubbuild: ->
    dub_build()
  dubrun: ->
    dub_run()
