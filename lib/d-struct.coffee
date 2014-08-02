# Grab a few objects that we'll need
popen = require('child_process').exec
path = require('path')
platform = require('os').platform

# Open a terminal and run dub
dub_build = ->
  # Run the terminal app
  cmdline = "osascript -e \'tell application \"Terminal\" to do script \"cd #{atom.project.path}; dub build\"\'"
  popen cmdline

module.exports =
  # Bind workspace command to run_dub
  activate: (state) ->
    atom.workspaceView.command "d-struct:dub-build", => @dubbuild()
  dubbuild: ->
    dub_build()
